#!/bin/sh

#set and confirm inputs
levelPassword="basic5password"
levelToBuild="basic5"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+')

## create static directories
cd /home/$userName
mkdir $levelToBuild


firstChar=${level_HASH::1}
secondChar=${level_HASH:2:1}
thirdChar=${level_HASH:3:1}
fourthChar=${level_HASH:4:1}

echo "firstchar="$firstChar
echo "secondchar="$secondChar
echo "thirdchar="$thirdChar
echo "fourthchar="$fourthChar

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
        i=`expr $i + 1`
        if [[ $i -eq $selectedItem ]]
        then
                secretfilename=$line
        fi
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
	echo "in the do loop "$i" times"
    if [[ $i -eq $secretfilelocation ]]
    then
		echo "in the secret location"
		#this is the signal file that has the correct value in it.
        filename="inhere.txt"
		mkdir $levelToBuild/$secretfilename
		echo $level_HASH | base64 | cut -c 1-8 > $levelToBuild/$secretfilename/$filename
	else
		echo "creating noise file"
		#this is the noise file
		filename="notinhere.txt"
		#echo $filename
		filenamehash=$(echo -n $filename | md5sum | grep -o '^\S\+')
		#echo $filenamehash
		mkdir $levelToBuild/$line
		echo $filenamehash | base64 | cut -c 1-8 > $levelToBuild/$line/$filename
    fi
	i=`expr $i + 1`
done < "$inputFile"

echo "*" > $readMeLocation
echo "*" >> $readMeLocation
echo "*" >> $readMeLocation
echo "Find the one file called inhere.txt. It's in the one directory" >> $readMeLocation
echo "that is named differnetly than the others." >> $readMeLocation
echo "The contents will be the password for this level." >>$readMeLocation
