#!/bin/bash

# number of days
days=7

# current date in seconds
current=$(date +%s)

# loop through all files in the current directory
for file in *
do
  # check if the file is older than X days
  if [ -f "$file" ] && [ $(($current - $(date +%s -r "$file"))) -gt $(($days * 24 * 60 * 60)) ]
  then
    # remove the file
    rm -rf "$file"
  fi
done