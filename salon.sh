#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
search_services=$($PSQL "select service_id, name from services")

LIST_SERVICES(){
  echo $1
    # list services
  echo "$search_services" | while read service_id bar name
  do
    echo $service_id")" $name
  done
  # read service_id
  read SERVICE_ID_SELECTED
  your_service_name=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $your_service_name ]]
  then
    LIST_SERVICES "I could not find that service. What would you like today?"
  fi
}

LIST_SERVICES
# ask for phone
echo "What's your phone number?"
read CUSTOMER_PHONE

your_customer_id=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $your_customer_id ]]
then
  # new customer
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  insert_customer=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  your_customer_id=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
fi
customer_name=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

echo What time would you like your $your_service_name, $customer_name?
read SERVICE_TIME

insert_customer=$($PSQL "insert into appointments(customer_id,service_id,time) values($your_customer_id,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")


echo I have put you down for a $your_service_name at $SERVICE_TIME, $customer_name.

