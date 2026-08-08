#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # find or insert winner team
    winner_id=$($PSQL "select team_id from teams where name='$winner'")
    if [[ -z $winner_id ]]
    then
      winner_insert=$($PSQL "insert into teams(name) values('$winner')")
      winner_id=$($PSQL "select team_id from teams where name='$winner'")
    fi
    # find or inert opponent team
    opponent_id=$($PSQL "select team_id from teams where name='$opponent'")
    if [[ -z $opponent_id ]]
    then
      opponent_insert=$($PSQL "insert into teams(name) values('$opponent')")
      opponent_id=$($PSQL "select team_id from teams where name='$opponent'")
    fi
    # insert games
    insert_game=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($year,'$round',$winner_id,$opponent_id,$winner_goals,$opponent_goals)")
  fi
done
