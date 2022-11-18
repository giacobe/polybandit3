#!/bin/sh

#set and confirm inputs
levelPassword="basic10password"
levelToBuild="basic10"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+')

## create static directories
cd /home
#mkdir $levelToBuild

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
        if [[ $i -eq $selectedItem ]]
        then
                value=$line
        fi
        i=`expr $i + 1`
done < "$inputFile"

#save the code in the filename
filename=$(echo $level_HASH | base64 | cut -c 1-8)
echo "This is the right file. The code is the file name" > $levelToBuild/$filename".txt"
echo "You might need this, too:"$value >> $levelToBuild/$filename".txt"

echo "*" > $readMeLocation
echo "*" >> $readMeLocation
echo "*" >> $readMeLocation
echo "The code is the filname of the only .txt file in this directory except for README.txt." >> $readMeLocation
echo "The code does not include '.txt'" >>$readMeLocation
