#!/bin/sh

#set and confirm inputs
levelPassword="level2password"
levelToBuild="level2"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+' | base64 | cut -c 1-8)
#echo $level_HASH | base64 | cut -c 1-8 > $levelToBuild/inhere.txt


#Create the Level Contents
mkdir $levelToBuild

cd $levelToBuild



echo "***************************************" > README.txt
echo "*   Welcome to Level 1 of The PolyLinux Game     *" >> README.txt
echo "*             Good Luck!              *" >> README.txt
echo "*    You created this session on:     *" >> README.txt
echo "*             $currentDate            *" >> README.txt
echo "***************************************" >> README.txt
echo "*Use the ls -a command to find the password*" >> README.txt

mkdir YouCantSeeMe

echo "$level_HASH" > .YouCanSeeMe.txt
