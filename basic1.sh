#!/bin/bash

#set and confirm inputs
levelPassword="basic1password"
levelToBuild="basic1"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+')

## create static directories
echo $userName
cd /home/$userName
mkdir $levelToBuild
echo $level_HASH | base64 | cut -c 1-8 > $levelToBuild/inhere.txt

echo "*" > $readMeLocation
echo "*" >> $readMeLocation
echo "*" >> $readMeLocation
echo "Display contents of the inhere.txt file in this directory." >> $readMeLocation
echo "The contents will be the password for this level." >>$readMeLocation
