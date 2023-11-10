#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# hide the password in a file called data.txt. There are 1000 lines of base64 that are repeated 4 times each. Embedded in those 4 sets is one
# line that is unique and different than all the others.


# Generate a random number. Use this number to be the file where the secret code is hidden.
random_location=$((RANDOM % 450 + 100))
input_file=$origInstallDir"/wordswithhashes.txt"
output_file="data.txt"

# Read each line from the input file and write it to the output file

# Make the first 1000 lines of noise

while IFS= read -r line; do
  echo "$line" | awk '{print $2}' >> "/home/$levelToBuild/$output_file"
done < "$input_file"

# Make the 2nd 1000 lines, repeating the first 1000

while IFS= read -r line; do
  echo "$line" | awk '{print $2}' >> "/home/$levelToBuild/$output_file"
done < "$input_file"

# Make the third grouping of 1000 lines, but at a random position, insert the flag

i=0
while IFS= read -r line; do
  echo "$line" | awk '{print $2}' >> "/home/$levelToBuild/$output_file"
  if [ $i -eq $random_location ]; then
    #echo -n "millionth " >> /home/$levelToBuild/$output_file
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 >> /home/$levelToBuild/$output_file
  fi
  i=$(($i + 1))
done < "$input_file"

# Repeat 1000 lines a fourth time

while IFS= read -r line; do
    echo "$line" | awk '{print $2}' >> "/home/$levelToBuild/$output_file"
done < "$input_file"

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is the line of the text file that appears ONLY ONCE."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild