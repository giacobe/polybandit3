#!/bin/sh

#set and confirm inputs
#levelPassword="basic1password"
#levelToBuild="basic1"
#readMeLocation=$levelToBuild"/README.txt"

#level_HASH=$(echo -n "$USER_ID$currentDate$SYSTEM_PASSWORD$newPass" | sha256sum | grep -o '^\S\+')

## create the user account

## create static directories
#echo $userName
cd /home
#mkdir $levelToBuild
echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-8 > $levelToBuild/inhere.txt

## Create the README.txt file
echo "* Display contents of the inhere.txt  *" >> $readMeLocation
echo "* file in this directory. The         *" >> $readMeLocation
echo "* contents will be the password for   *" >> $readMeLocation
echo "* this level.                         *" >> $readMeLocation
echo "***************************************" >> $readMeLocation
