#!/bin/sh

## get system date and psu email, create hash for directories
workingDir=$(pwd)
ourPass="supersecure"
currentDate=$(date +"%Y-%m-%d")
USER_ID=""
## need to do some validation for email input
echo "Enter your PSU email (xyz1234@psu.edu): "
read -r USER_ID

## generate user hash based on ID, date, and backend pass
USER_HASH=$(echo "$USER_ID$currentDate$ourPass" | md5sum | grep -o '^\S\+' | tr 'a-z' 'A-Z')
echo "$USER_HASH"

## export for level and verify scripts
export USER_HASH
export workingDir

## buildroot doesn't have a home directory by default, so we add one
mkdir /home/

## create new user in the home directory, set password
userName="polylinuxgame"
userPass="Password1"

mkdir /home/$userName
adduser -h /home/$userName --disabled-password $userName
passwd $userName -d $userPass

## create levels
/bin/sh $workingDir/level1.sh
#bash level2.sh
#bash level3.sh
#bash level4.sh
#bash level5.sh
#bash level6.sh
#bash level7.sh
#bash level8.sh
#bash level9.sh
#bash level10.sh

## remove install scripts
#rm level1.sh
#rm level2.sh
#rm level3.sh
#rm level4.sh
#rm level5.sh
#rm level6.sh
#rm level7.sh
#rm level8.sh
#rm level9.sh
#rm level10.sh
#rm -rf dictionaries
#rm README.md

## copy create levels into new user folder
cp -r /$workingDir/* /home/"$userName"/

## remove install scripts from home directory
#rm /home/"$userName"/level1Verify.sh
#rm /home/polylinuxgame/level2Verify.sh
#rm /home/polylinuxgame/level3Verify.sh
#rm /home/polylinuxgame/level4Verify.sh
#rm /home/polylinuxgame/level5Verify.sh
#rm /home/polylinuxgame/level6Verify.sh
#rm /home/polylinuxgame/level7Verify.sh
#rm /home/polylinuxgame/level8Verify.sh
#rm /home/polylinuxgame/level9Verify.sh
#rm /home/polylinuxgame/level10Verify.sh

## remove root clone of game
#rm -rf /root/*
## change permissions of levels to new user
chown -R $userName /home/$userName

clear

echo "Done!" 
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "*    You created this session on:     *"
echo "*             $currentDate              *"
echo "***************************************"
## drops user into new shell as new user
su -l $userName
