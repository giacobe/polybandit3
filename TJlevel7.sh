#!/bin/sh

#set and confirm inputs
levelPassword="level7password"
levelToBuild="level7"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+' | base64 | cut -c 1-8)

#Create level contents
mkdir $levelToBuild

cd $levelToBuild

#create readme.txt

echo "***************************************" > README.txt
echo "*   Welcome to Level 7 of The PolyLinux Game     *" >> README.txt
echo "*             Good Luck!              *" >> README.txt
echo "*    You created this session on:     *" >> README.txt
echo "*             $currentDate            *" >> README.txt
echo "***************************************" >> README.txt
echo "*Use the find command to discover the password inside of a hidden file called inhere.txt*" >> README.txt

#create level contents


#---- DATA LEAK ISSUE ----


#create the first directory
mkdir Bobby
cd Bobby
echo "This location is not what you were looking for" > Music.txt
echo "This location is not what you were looking for" > Documents.txt
echo "This location is not what you were looking for" > Pictures.txt
echo "This location is not what you were looking for" > Videos.txt
cd ..
#-------------------------------------- End of Directory
mkdir Larissa
cd Larissa
echo "This location is not what you were looking for" > Documents.txt
echo "This location is not what you were looking for" > Music.txt
echo "This location is not what you were looking for" > Emails.txt
echo "This location is not what you were looking for" > Videos.txt
#Temporary Point to where I need to be
cd ..
#-------------------------------------- End of Directory
mkdir Nick
cd Nick
echo "This location is not what you were looking for" > Music.txt
echo "This location is not what you were looking for" > Documents.txt
echo "This location is not what you were looking for" > Pictures.txt
echo "This location is not what you were looking for" > Videos.txt
#Temporary Point to where I need to be
cd ..
#-------------------------------------- End of Directory
mkdir Kathy
cd Kathy
echo "This location is not what you were looking for" > Music.txt
echo "This location is not what you were looking for" > Pictures.txt
echo  "$level_HASH" > .inhere.txt
echo "This location is not what you were looking for" > Documents.txt
echo "This location is not what you were looking for" > Videos.txt
cd..
