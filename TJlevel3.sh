#!/bin/sh


#set and confirm inputs
levelPassword="level3password"
levelToBuild="level3"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+' | base64 | cut -c 1-8)

#Create level contents
mkdir $levelToBuild

cd $levelToBuild

#create readme.txt

echo "***************************************" > README.txt
echo "*   Welcome to Level 3 of The PolyLinux Game     *" >> README.txt
echo "*             Good Luck!              *" >> README.txt
echo "*    You created this session on:     *" >> README.txt
echo "*             $currentDate            *" >> README.txt
echo "***************************************" >> README.txt
echo "*Use the cat command to find the password inside a text document*" >> README.txt



echo "This is not what you are looking for" > Beaver.txt
echo "This is not what you are looking for" > Atherton.txt
echo "This is not what you are looking for" > Pollock.txt
echo "This is not what you are looking for" > Shortlidge.txt
echo "This is not what you are looking for" > University.txt


 echo "$level_HASH" > inhere.txt
