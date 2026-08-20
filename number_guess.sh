#!/bin/bash
echo Enter your username:
read username
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
user_result="$($PSQL "select * from users where username='$username'")"
last_best_game=0
if [[ -z $user_result ]]
then
  echo "Welcome, $username! It looks like this is your first time here."
else
  # 修复1：用 Here-String 替代管道，避免子 Shell 导致变量丢失
  while IFS="|" read name games_played best_game
  do 
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
    last_best_game=$best_game
  done <<< "$user_result"
fi

secret_number=$(( $RANDOM%1000+1 ))

echo "Guess the secret number between 1 and 1000:"
number_of_guesses=0
guess=0
while (( guess != secret_number ))
do
  read guess
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    let number_of_guesses=number_of_guesses-1
  else
    if (( guess > secret_number ))
    then 
      echo "It's lower than that, guess again:"
    elif (( guess < secret_number ))
    then
      echo "It's higher than that, guess again:"
    fi
  fi
  let number_of_guesses=number_of_guesses+1
done
echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"

if [[ -z $user_result ]]
then
  record_result="$($PSQL "insert into users(username,games_played,best_game) values('$username',1,$number_of_guesses)")"
else

  if (( last_best_game > number_of_guesses ))
  then
    let last_best_game=number_of_guesses
  fi
  record_result="$($PSQL "update users set games_played=games_played+1,best_game=$last_best_game where username='$username'")"
fi
