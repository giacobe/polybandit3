#!/bin/sh

#set and confirm inputs
levelPassword="basic4password"
levelToBuild="basic4"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+')

## create static directories
cd /home/$userName
mkdir $levelToBuild

#select the dictionary to be used from the first characater in the level_HASH

firstChar=${level_HASH::1}
inputFile=$origInstallDir"/dictionaries/dict"$firstChar".txt"

#select the item from the dictionary to be used from the second caracter in the leve_HASH

secondChar=${level_HASH:2:1}

#Convert the hex to binary, and pull that nth item from the list, save it as "selectedItem"

hexdigits='0 1 2 3 4 5 6 7 8 9 a b c d e f'
i=0
for hexdigit in $hexdigits; do
	if [[ "$hexdigit" = "$secondChar" ]]; then
		selectedItem=$i
	fi
	i=`expr $i + 1`
done

#create the filename with the nth value from the list

i=0
while read -r line
do
        i=`expr $i + 1`
        if [[ $i -eq $selectedItem ]]
        then
                secretfilename=$line".txt"
        fi
done < "$inputFile"

#select the dictionary to be used for NOISE from the third characater in the level_HASH

thirdChar=${level_HASH:3:1}
fourthChar=${level_HASH:4:1}

inputFile=$origInstallDir"/dictionaries/dict"$thirdChar".txt"

hexdigits='0 1 2 3 4 5 6 7 8 9 a b c d e f'
i=0
for hexdigit in $hexdigits; do
	if [[ "$hexdigit" = "$fourthChar" ]]; then
		secretfilelocation=$i
	fi
	i=`expr $i + 1`
done

i=0
while read -r line
do
        i=`expr $i + 1`
        if [[ $i -eq $secretfilelocation ]]
        then
            filename=$secretfilename
			echo $level_HASH | base64 | cut -c 1-8 > $levelToBuild/$filename
		else
			filename=$line".txt"
			#echo $filename
			filenamehash=$(echo -n $filename | md5sum | grep -o '^\S\+')
			#echo $filenamehash
			echo $filenamehash | base64 | cut -c 1-8 > $levelToBuild/$filename
        fi
		
done < "$inputFile"

#save the code in the filename


echo "*" > $readMeLocation
echo "*" >> $readMeLocation
echo "*" >> $readMeLocation
echo "Display contents of the .txt file in this directory that is different than the others." >> $readMeLocation
echo "The contents will be the password for this level." >>$readMeLocation
