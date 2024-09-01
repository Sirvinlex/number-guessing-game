#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NO=$((1 + $RANDOM % 1000))
# echo "$RANDOM_NO"
GCOUNT=1
INC_COUNT() {
  GCOUNT=$((GCOUNT+1))
}

MAIN_MENU() {
  NUM=$RANDOM_NO
  echo "Enter your username:"
  read USERNAME
  GET_USERNAME=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

  if [[ -z $GET_USERNAME ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    GUESS
    read SECRET_NO
    GUESS_FUNC $SECRET_NO $NUM
  else
    GEAME_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GEAME_PLAYED games, and your best game took $BEST_GAME guesses."

    # echo "Guess the secret number between 1 and 1000:"
    GUESS
    read SECRET_NO
    GUESS_FUNC $SECRET_NO $NUM
    
  fi
}

GUESS_FUNC() {
  # might need to check when no value is entered
  
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    # echo "not a number"
    # COUNT+=1
    # COUNT=$((COUNT+1))
    INC_COUNT
    GUESS "That is not an integer, guess again:"
    read SECRET_NO
    GUESS_FUNC $SECRET_NO $2
  else
    # echo "a number $1"
    if [[ $1 -gt $2 ]]
    then
      # echo "$1 greater than $2
      INC_COUNT
      GUESS "It's higher than that, guess again:"
      read SECRET_NO
      GUESS_FUNC $SECRET_NO $2
      
    elif [[ $1 -lt $2 ]] 
    then
      # echo "$1 smaller than $2"
      INC_COUNT
      GUESS "It's lower than that, guess again:"
      read SECRET_NO
      GUESS_FUNC $SECRET_NO $2
      
    else
      # echo "$1 equal $2 in $COUNT count"
      # INC_COUNT
      CN=$GCOUNT
      PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
      BEST=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
      
      if [[ -z $BEST || $BEST -gt $CN ]]
      then
        BEST=$CN
      fi
      # echo "values $((PLAYED+1)) $BEST"
      UPDATE_TABLE=$($PSQL "UPDATE users SET games_played = $((PLAYED+1)), best_game = $BEST WHERE username = '$USERNAME'")

      echo "You guessed it in $CN tries. The secret number was $2. Nice job!"
    fi
  fi
  
  # echo "count is $COUNT"
}


GUESS() {
  if [[ $1 ]]
  then
    echo "$1"
  else
    echo "Guess the secret number between 1 and 1000:"
  fi
}
MAIN_MENU


