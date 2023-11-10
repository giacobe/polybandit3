#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# hide this code by encoding it as a message encrypted with ROT13

output_file=data.txt

# Generate a random number. Use this number to be the file where the secret code is hidden.

cd /home/$levelToBuild

message="the flag for this level is "
message2=$(echo "$level_HASH" | base64 | tr -d "\r\n" | cut -c 1-20)

# apply a ROT13 transformation to the message and save it in the output_file
echo "${message}${message2}" | tr '[a-zA-Z]' '[n-za-mN-ZA-M]' > $output_file

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild