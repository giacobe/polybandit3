#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as a file somewhere on the OS. Set that file's ownership to be the current level, and group to be the previous level.

# Make the inhere directory
#mkdir /home/$levelToBuild/inhere

# Generate a random number. Use this number to be the file where the secret code is hidden.
random_location=$((RANDOM % 450 + 100))
input_file=$origInstallDir"/wordswithhashes.txt"
output_file="data.txt"

# Read each line from the input file and write it to the output file
i=0
while IFS= read -r line; do
  echo "$line" >> "/home/$levelToBuild/$output_file"
  if [ $i -eq $random_location ]; then	
    echo -n "millionth " >> /home/$levelToBuild/$output_file
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 >> /home/$levelToBuild/$output_file
  fi
  i=$(($i + 1))
done < "$input_file"

#echo "File $output_file created with content from $input_file."

# Create the file that has the correct value in it
#echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "$random_directory/$levelToBuild.password"

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the file data.txt next to the word millionth."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild