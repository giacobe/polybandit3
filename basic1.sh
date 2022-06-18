#!/bin/bash

#set and confirm inputs
basic1Password="basic1password"
levelToBuild="basic1"
readMeLocation=$levelToBuild+"/README.txt"
echo $USER_ID >> vars.txt
echo $currentDate >> vars.txt
echo $newPass >> vars.txt
echo $basic1Password >> vars.txt
#echo $levelToBuild >> vars.txt

export BASIC1_HASH=$(echo -n "$USER_ID"+"$currentDate"+"$newPass"+"$basic1Password" | md5sum | grep -o '^\S\+')

## create static directories
echo $userName
cd /home/$userName
mkdir $levelToBuild
echo $BASIC1_HASH | base64 | cut -c 1-8 > $levelToBuild/inhere.txt

readMeLocation=$levelToBuild"/README.txt"

echo "*" > $readMeLocation
echo "*" >> $readMeLocation
echo "*" >> $readMeLocation
echo "Display contents of the inhere.txt file in this directory." >> $readMeLocation
echo "The contents will be the password for this level." >>$readMeLocation
