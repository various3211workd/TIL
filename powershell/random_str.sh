#!/bin/bash

if [ $# -ne 1 ]; then
  echo "./random_str <num>"
  exit 1
else
  NEW_UUID_MORE_CHARACTERS=$(cat /dev/urandom | LC_CTYPE=C tr -dc "a-zA-Z0-9!@#$%^&*()_+?><~\`;'" | fold -w $1 | head -n 1)
  echo $NEW_UUID_MORE_CHARACTERS
fi