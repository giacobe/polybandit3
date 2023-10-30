#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as a file somewhere on the OS. Set that file's ownership to be the current level, and group to be the previous level.

# Make the inhere directory
mkdir /home/$levelToBuild/inhere

# Generate a random number. Use this number to be the file where the secret code is hidden.
#random_directory=$((RANDOM % 20 + 10))
random_directory="/etc"
levelsetname=$(echo "$levelToBuild" | tr -d '[:digit:]')
levelnumber=$(echo "$levelToBuild" | tr -d -C '[:digit:]')


# Create the file that has the correct value in it
echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "$random_directory/$levelToBuild.password"
chown $levelToBuild:$levelsetname$(( $levelnumber - 1 )) $random_directory/$levelToBuild".password"

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is in *SOME DIRECTORY SOMEWHERE ON THIS COMPUTER*. The file size will be exactly 21 characters. The file owner will be $levelToBuild. The group will be $levelsetname$(( $levelnumber - 1 ))."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild