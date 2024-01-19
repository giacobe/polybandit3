#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# The flag for this level is hiddent inside of compressed archives and file formats
# There are several files inside of files. The player should use the "file" command to
# figure out what the file type is, then decompress/extract it ... and repeat until they
# get to the final text message.

output_file=data.txt

# Generate a random number. Use this number to be the file where the secret code is hidden.

cd /home/$levelToBuild

message="the flag for this level is "
message2=$(echo "$level_HASH" | base64 | tr -d "\r\n" | cut -c 1-20)

# Copy the message and save it in the file called "data9"
echo "${message}${message2}" > data9


#gzip data9 into data9.gz
	gzip data9


# move data9.gz into data8.bin
	mv data9.gz data8.bin


# tar data8.bin into data8.tar
	tar c data8.bin -f data8.tar
	rm data8.bin


# move data8.tar into data7
	mv data8.tar data7


# bzip2 data7 into data7.bz
	bzip2 data7


# move data7.bz2 into data6.bin
	mv data7.bz2 data6.bin


# tar data6.bin into data6.tar
	tar c data6.bin -f data6.tar
	rm data6.bin


# mv data6.tar into data5.bin
	mv data6.tar data5.bin


# tar data5.bin into data5.tar
	tar c data5.bin -f data5.tar
	rm data5.bin


# mv data5.tar into data4
	mv data5.tar data4


# gzip data4 into data4.gz
	gzip data4


# mv data4.gz into data3
	mv data4.gz data3


# bzip2 data3 into data3.bz
	bzip2 data3


# mv data3.bz2 into data2
	mv data3.bz2 data2


# gzip data2 into data2.gz
	gzip data2


# mv data2.gz into data2.bin
	mv data2.gz data2.bin


# xxd data2.bin into data.txt
	xxd data2.bin > data.txt
	rm data2.bin


# 

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed."
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild