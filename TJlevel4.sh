#!/bin/sh

#set and confirm inputs
levelPassword="level4password"
levelToBuild="level4"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+' | base64 | cut -c 1-8)

#Create level contents
mkdir $levelToBuild

cd $levelToBuild

#create readme.txt

echo "***************************************" > README.txt
echo "*   Welcome to Level 4 of The PolyLinux Game     *" >> README.txt
echo "*             Good Luck!              *" >> README.txt
echo "*    You created this session on:     *" >> README.txt
echo "*             $currentDate            *" >> README.txt
echo "***************************************" >> README.txt
echo "*Use the cd and ls commands to find the password inside the directories*" >> README.txt

#create level contents

#create the first directory
mkdir Philadelphia
cd /mnt/level4/Philadelphia
echo "This location is not what you were looking for" > Art.txt
echo "This location is not what you were looking for" > Buildings.txt
echo "This location is not what you were looking for" > Stadiums.txt
#-------------------------------------- End of Directory
mkdir SouthPhilly
cd /mnt/level4/Philadelphia/SouthPhilly
echo "This location is not what you were looking for" > Food.txt
echo "This location is not what you were looking for" > Italy.txt
echo "This location is not what you were looking for" > People.txt
#-------------------------------------- End of Directory
mkdir Sports
cd /mnt/level4/Philadelphia/SouthPhilly/Sports
touch "$level_HASH"
echo "This location is not what you were looking for" > Phillies.txt
echo "This location is not what you were looking for" > Eagles.txt
echo "This location is not what you were looking for" > 76ers.txt
echo "This location is not what you were looking for" > Flyers.txt
