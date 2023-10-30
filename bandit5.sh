#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as the flag in /home/level5/inhere in one of the files called "-file00" through "-file09"

# Make the inhere directory
mkdir /home/$levelToBuild/inhere

# Function to generate a random number between 0 and 9
generate_random_number() {
  echo $((RANDOM % 10))
}

# Generate a random number. Use this number to be the file where the secret code is hidden.
random_number=$(generate_random_number)

# Create the Files
for i in $(seq 0 9); do
  if [ "$i" -eq "$random_number" ]; then
   	# Create the file that has the correct value in it
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/-file0$i"
  else
	# Now make some noise files by putting random hex values into a series of file names
	create_binary_non_printable_file "/home/$levelToBuild/inhere/-file0$i" 20
  fi
done

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the only human-readable file in the inhere directory. "
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild