#!/bin/sh

#set and confirm inputs
#levelPassword="basic7password"
#levelToBuild="basic7"
#readMeLocation=$levelToBuild"/README.txt"

#level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | sha256sum | grep -o '^\S\+')

## create static directories
cd /home
#mkdir $levelToBuild


firstChar=${level_HASH::1}
secondChar=${level_HASH:2:1}
thirdChar=${level_HASH:3:1}
fourthChar=${level_HASH:4:1}

#select the dictionary to be used from the first characater in the level_HASH

inputFile=$origInstallDir"/dictionaries/dict"$firstChar".txt"

#select the item from the dictionary to be used as the filename
#first, convert the hex to binary, and pull that nth item from the list, save it as "selectedItem"
hex='0123456789abcdef'
hexdigits='0 1 2 3 4 5 6 7 8 9 a b c d e f'

#second, get the decimal value of the 2nd hash character, save it as "selectedItem"
i=0
for hexdigit in $hexdigits; do
	if [[ "$hexdigit" = "$secondChar" ]]; then
		selectedItem=$i
	fi
	i=`expr $i + 1`
done

#third, create the get the nth word from the list, and use it as the "secretfilename"
i=0
while read -r line
do
        if [[ $i -eq $selectedItem ]]
        then
                secretfilename=$line
        fi
        i=`expr $i + 1`
done < "$inputFile"

#select the dictionary to be used for NOISE from the third characater in the level_HASH
#but it cannot be the same as the firstChar. If it is, then advance thirdChar by 1, but keep it in Hex.
i=0
for hexdigit in $hexdigits; do
        if [[ "$hexdigit" = "$thirdChar" ]]; then
                if [[ "$thirdChar" = "$firstChar" ]]; then
                        if [[ "$thirdChar" = "f" ]]; then
							i=`expr $i + 1`
                            noisefile=0
                        else
							i=`expr $i + 1`
                            noisefile=${hex:$i:1}
                        fi
                else
						i=`expr $i + 1`
                        noisefile=$thirdChar
                fi
        fi
done

inputFile=$origInstallDir"/dictionaries/dict"$noisefile".txt"

#determine which order to create the noise file in.
i=0
for hexdigit in $hexdigits; do
	if [[ "$hexdigit" = "$fourthChar" ]]; then
		secretfilelocation=$i
	fi
	i=`expr $i + 1`
done

#create the signal and noise files
i=0
while read -r line
do
    if [[ $i -eq $secretfilelocation ]]
    then
		#this is the signal file that has the correct value in it.
        filename="inhere.txt"
		secretfilenameextension=$(echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-8)
		mkdir $levelToBuild/$line"-"$secretfilenameextension
		#echo $level_HASH | base64 | cut -c 1-8 > $levelToBuild/$line/$filename
	else
		#this is the noise file
		filename="notinhere.txt"
		filenamehash=$(echo -n $filename | md5sum | grep -o '^\S\+')
		mkdir $levelToBuild/$line
		#echo $filenamehash | base64 -w 0 | cut -c 1-8 > $levelToBuild/$line/$filename
    fi
	i=`expr $i + 1`
done < "$inputFile"

echo "* Figure out the code. It is part of  *" >> $readMeLocation
echo "* the name of a directory. The code is*" >> $readMeLocation
echo "* the characters that follow the dash *" >> $readMeLocation
echo "* in the directory name.              *" >> $readMeLocation
echo "***************************************" >> $readMeLocation
