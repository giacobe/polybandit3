#!/bin/bash

declare -a dict1
declare -a dict2
declare -a dict3
declare -a dict4
declare -a dict5
declare -a dict6
declare -a dict7
declare -a dict8
declare -a dict9
declare -a dict10
declare -a dict11
declare -a dict12
declare -a dict13
declare -a dict14
declare -a dict15
declare -a dict16
declare -a dict17

readarray -t dict2 <dictionaries/airlines.txt
readarray -t dict7 <dictionaries/appliances.txt
readarray -t dict11 <dictionaries/beerBrands.txt
readarray -t dict10 <dictionaries/candy.txt
readarray -t dict5 <dictionaries/carBrands.txt
readarray -t dict13 <dictionaries/cheese.txt
readarray -t dict16 <dictionaries/cities.txt
readarray -t dict3 <dictionaries/clothingBrands.txt
readarray -t dict14 <dictionaries/instruments.txt
readarray -t dict4 <dictionaries/countries.txt
readarray -t dict9 <dictionaries/dogBreeds.txt
readarray -t dict15 <dictionaries/fruits.txt
readarray -t dict1 <dictionaries/operatingSystems.txt
readarray -t dict8 <dictionaries/seasonings.txt
readarray -t dict12 <dictionaries/sports.txt
readarray -t dict6 <dictionaries/fastFood.txt
readarray -t dict17 <dictionaries/createdDirectoryDictionary.txt

#set and confirm inputs
levelPassword="basic3password"
levelToBuild="basic3"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+')

## create static directories
#echo $userName
cd /home/$userName
mkdir $levelToBuild

filename="inhere.txt"
filename=$dict2[4]".txt"

echo $level_HASH | base64 | cut -c 1-8 > $levelToBuild/$filename

echo "*" > $readMeLocation
echo "*" >> $readMeLocation
echo "*" >> $readMeLocation
echo "Display contents of the only .txt file in this directory except for README.txt." >> $readMeLocation
echo "The contents will be the password for this level." >>$readMeLocation
