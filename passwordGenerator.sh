#!/bin/bash

echo "Enter number of passwords you need to generate:"
read NO_OF_PASSWORDS
echo "Enter password length:"
read PASS_LEN


echo "Generating $NO_OF_PASSWORDS passwords:"
for p in $(seq 1 $NO_OF_PASSWORDS);
do

        PASSWORD=$(openssl rand -base64 $PASS_LEN)
        echo "${PASSWORD}"
done