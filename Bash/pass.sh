#!/bin/bash

#Password Generator Script
PASS_LENGTH=$1
SPECIAL_CHARACTERS=$2

pass_gen() {

  base64 /dev/urandom | head -10 | tr -d -c 'A-Za-z0-9' | cut -c1-$PASS_LENGTH
}

pass_gen_with_charset() {

  tr </dev/urandom -cd "[:print:]" | head -c $PASS_LENGTH | cut -c1-$PASS_LENGTH
}

if [ -z "$SPECIAL_CHARACTERS" ]; then
  pass_gen
else
  pass_gen_with_charset
fi
