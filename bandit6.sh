#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# store this as the flag in /home/level6/inhere in one of the directories called "maybehereXX" 
# and in one of the files there. They are called -file1 through -file3, .file1 through .file3 or spaces file1 through spaces file3

# Make the inhere directory
mkdir /home/$levelToBuild/inhere

# Create the Noise Files
for j in $(seq 10 29); do
        # Create the directory called maybehere##
		maybeheredir="/home/$levelToBuild/inhere/maybehere$j"
		mkdir $maybeheredir

# Generate MD5 hash
md5hash=$(echo -n "$level_HASH$maybeheredir" | md5sum | cut -d ' ' -f 1)

# Extract the first 10 hexadecimal digits
hexdigits=$(echo "$md5hash" | cut -c 1-10)

# Function to convert a hexadecimal number to decimal
hex_to_dec() {
  echo "ibase=16; $1" | bc
}

# Save the decimal values in variables digit1 through digit10
digit1=$(hex_to_dec ${hexdigits:0:1})
digit2=$(hex_to_dec ${hexdigits:1:1})
digit3=$(hex_to_dec ${hexdigits:2:1})
digit4=$(hex_to_dec ${hexdigits:3:1})
digit5=$(hex_to_dec ${hexdigits:4:1})
digit6=$(hex_to_dec ${hexdigits:5:1})
digit7=$(hex_to_dec ${hexdigits:6:1})
digit8=$(hex_to_dec ${hexdigits:7:1})
digit9=$(hex_to_dec ${hexdigits:8:1})
digit10=$(hex_to_dec ${hexdigits:9:1})

# Display the results
#echo "MD5 Hash: $md5hash"
#echo "Decimal values: digit1=$digit1, digit2=$digit2, digit3=$digit3, digit4=$digit4, digit5=$digit5, digit6=$digit6, digit7=$digit7, digit8=$digit8, digit9=$digit9, digit10=$digit10"

        location=$((RANDOM % 2))
		
#		buffer50=$((RANDOM % 50))
#		buffer100=$((RANDOM % 100))
		
		
		# Create 3 files starting with a -  They are -file1, -file2, and -file3
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ $digit1 -gt 4 ]; then
			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/-file1" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/-file1"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/-file1" $((100 + $((RANDOM % 100)) ))
		fi
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit2 -gt 4 ]; then		
			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/-file2" $((190 + $((RANDOM % 50)) ))
		chmod +x "/home/$levelToBuild/inhere/maybehere$j/-file2"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/-file2" $((100 + $((RANDOM % 100)) ))
		fi
		
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit3 -gt 4 ]; then
			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/-file3" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/-file3"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/-file3" $((100 + $((RANDOM % 100)) ))
		fi
		
        # Create 3 files starting with a .  They are .file1, .file2, and .file3
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ $digit4 -gt 4 ]; then
#		if [ 1 -eq 1 ]; then
			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/.file1" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/.file1"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/.file1" $((100 + $((RANDOM % 100)) ))
		fi
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit5 -gt 4 ]; then

			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/.file2" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/.file2"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/.file2" $((100 + $((RANDOM % 100)) ))
		fi
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit6 -gt 4 ]; then
			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/.file3" $((190 + $((RANDOM % 50)) ))
				chmod +x "/home/$levelToBuild/inhere/maybehere$j/.file3"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/.file3" $((100 + $((RANDOM % 100)) ))
		fi
		
		
        # Create 3 files with spaces in their file names: spaces file1, spaces file2, and spaces file3
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit7 -gt 4 ]; then

			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/spaces file1" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/spaces file1"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/spaces file1" $((100 + $((RANDOM % 100)) ))
		fi
		
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit8 -gt 4 ]; then

			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/spaces file2" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/spaces file2"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/spaces file2" $((100 + $((RANDOM % 100)) ))
		fi
		if [ $((RANDOM % 2)) -eq 1 ]; then
#		if [ 1 -eq 1 ]; then
#		if [ $digit9 -gt 4 ]; then

			create_binary_non_printable_file "/home/$levelToBuild/inhere/maybehere$j/spaces file3" $((190 + $((RANDOM % 50)) ))
			chmod +x "/home/$levelToBuild/inhere/maybehere$j/spaces file3"
		else
			generate_base64_file "/home/$levelToBuild/inhere/maybehere$j/spaces file3" $((100 + $((RANDOM % 100)) ))
		fi
done

# Generate a random number. Use this number to be the file where the secret code is hidden.
random_directory=$((RANDOM % 20 + 10))

# Create the file that has the correct value in it
file_location=$((RANDOM % 9))
if [ $(($file_location)) -eq '1' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/-file1"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/-file1"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/-file1"
elif [ $(($file_location))  -eq '2' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/-file2"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/-file2"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/-file2"
elif [ $(($file_location))  -eq '3' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/-file3"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/-file3"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/-file3"
elif [ $(($file_location))  -eq '4' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/.file1"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/.file1"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/.file1"
elif [ $(($file_location))  -eq '5' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/.file2"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/.file2"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/.file2"
elif [ $(($file_location))  -eq '6' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/.file3"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/.file3"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/.file3"
elif [ $(($file_location))  -eq '7' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file1"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file1"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file1"
	
elif [ $(($file_location))  -eq '8' ]; then
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file2"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file2"
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file2"
else
	echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 > "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file3"
	echo "                                                                                                                                                                                       " >> "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file3"	
	chmod -x "/home/$levelToBuild/inhere/maybehere$random_directory/spaces file3"
fi


cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the only human-readable file in the inhere directory. The file size will be exactly 205 characters. The file will not be executable."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild