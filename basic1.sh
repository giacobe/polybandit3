#!/bin/bash

#set and confirm inputs
basic1Password="basic1password"
echo $USER_ID
echo $currentDate
echo $newPass
echo $basic1Password

export BASIC1_HASH=$(echo -n "$USER_ID"+"$currentDate"+"$newPass"+"$basic1Password" | md5sum | grep -o '^\S\+')

## create static directories
echo $userName
cd /home/$userName
mkdir "basic1"
echo $BASIC1_HASH > basic1/inhere.txt

echo "*" > basic1/README.txt
echo "*" >> basic1/README.txt
echo "*" >> basic1/README.txt
echo "Display contents of the one file you find in this directory." >> basic1/README.txt
echo "The contents will be the password for this level." >> basic1/README.txt
