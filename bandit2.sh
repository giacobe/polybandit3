#!/bin/sh
cd /root
. ./resources.sh
cd /home
# set and confirm inputs

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as the flag in /home/level1/

echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > /home/$levelToBuild/-
cd /home

## Create the README.txt file
#echo "* Instructions for Bandit Level 2:    *" >> $readMeLocation
levelinstructions="The flag for this level is stored in a file called - located in the home directory."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation