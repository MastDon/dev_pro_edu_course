#!/bin/bash

read -p "Set password length : " PASS_LENGTH
read -p "Use special characters? Print y or n : " SPECIAL_CHARACTERS


pass_gen() {

  base64 /dev/urandom | head -10 | tr -d -c 'A-Za-z0-9' | cut -c1-$PASS_LENGTH
}

pass_gen_with_characters() {

  tr </dev/urandom -cd "[:print:]" | head -c $PASS_LENGTH | cut -c1-$PASS_LENGTH
}



if [ "$SPECIAL_CHARACTERS" = "y" ]; then
  pass_gen_with_characters
elif [ "$SPECIAL_CHARACTERS" = "n" ]; then
  pass_gen
else
  echo "You need to use only number in 'password length' and only 'y' or 'n' when you choose special characters  ."
fi



