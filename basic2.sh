#!/bin/sh

#set and confirm inputs
#levelPassword="basic2password"
#levelToBuild="basic2"
#readMeLocation=$levelToBuild"/README.txt"

#level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | sha256sum | grep -o '^\S\+')

## create static directories
#echo $userName
cd /home
#mkdir $levelToBuild
echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-8 > $levelToBuild/.inhere.txt

echo "* Display contents of the .inhere.txt *" >> $readMeLocation
echo "* file in this directory. The         *" >> $readMeLocation
echo "* contents will be the password for   *" >> $readMeLocation
echo "* this level.                         *" >> $readMeLocation
echo "* Note: This file is 'hidden'         *" >> $readMeLocation
echo "***************************************" >> $readMeLocation
