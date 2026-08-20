if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  # get element by id
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    fetch_result="$($PSQL "select * from elements where atomic_number=$1;")"
  fi
  # get element by symbol or name
  if [[ -z $fetch_result ]]
  then
    fetch_result="$($PSQL "select * from elements where symbol='$1' or name='$1';")"
  fi
  # output result
  if [[ -z $fetch_result ]]
  then
    echo I could not find that element in the database.
  else
    echo $fetch_result | while IFS="|" read atomic_number symbol name
    do
      prop_result="$($PSQL "select type,atomic_mass,melting_point_celsius,boiling_point_celsius from properties inner join types on properties.type_id=types.type_id where atomic_number=$atomic_number;")"
      echo $prop_result | while IFS="|" read type atomic_mass melting_point_celsius boiling_point_celsius
      do
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
      done 
    done
  fi
fi
