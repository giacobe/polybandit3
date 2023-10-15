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

# Function to generate a random number between 0 and 19
generate_random_number() {
  echo $((RANDOM % 19))
}

# Generate a random number. Use this number to be the file where the secret code is hidden.
random_directory=$(generate_random_number)

# Create the Files
for j in $(seq 0 19); do
  #if [ "$j" -eq "$random_directory" ]; then
	# Create a random number to choose which file to bury the flag inside
	random_file_location=$((RANDOM % 9))
	# Create the directory called maybehere##
	mkdir /home/$levelToBuild/inhere/maybehere$j
	# Create 3 files starting with a -  They are -file1, -file2, and -file3
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/-file1" $((100 + $((RANDOM % 100)) ))
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/-file2" $((100 + $((RANDOM % 100)) ))
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/-file3" $((100 + $((RANDOM % 100)) ))
	# Create 3 files starting with a .  They are .file1, .file2, and .file3
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/.file1" $((100 + $((RANDOM % 100)) ))
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/.file2" $((100 + $((RANDOM % 100)) ))
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/.file3" $((100 + $((RANDOM % 100)) ))
	# Create 3 files with spaces in their file names: spaces file1, spaces file2, and spaces file3
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/spaces file1" $((100 + $((RANDOM % 100)) ))
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/spaces file2" $((100 + $((RANDOM % 100)) ))
	create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/spaces file3" $((100 + $((RANDOM % 100)) ))
done
	
# Create the file that has the correct value in it
echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/.file2"
echo "                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/.file2"
#fi

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the only human-readable file in the inhere directory. "
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation