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
/bin/sh $workingDir/level1FM.sh
/bin/sh $workingDir/level2FM.sh
/bin/sh $workingDir/level3FM.sh
/bin/sh $workingDir/level4FM.sh
/bin/sh $workingDir/level5FM.sh
/bin/sh $workingDir/level6FM.sh
/bin/sh $workingDir/level7FM.sh
/bin/sh $workingDir/level8FM.sh
/bin/sh $workingDir/level9FM.sh
/bin/sh $workingDir/level10FM.sh
/bin/sh $workingDir/level11FM.sh
/bin/sh $workingDir/level12FM.sh
/bin/sh $workingDir/level13FM.sh


## remove install scripts
rm $workingDir/level1FM.sh
rm $workingDir/level2FM.sh
rm $workingDir/level3FM.sh
rm $workingDir/level4FM.sh
rm $workingDir/level5FM.sh
rm $workingDir/level6FM.sh
rm $workingDir/level7FM.sh
rm $workingDir/level8FM.sh
rm $workingDir/level9FM.sh
rm $workingDir/level10FM.sh
rm $workingDir/level11FM.sh
rm $workingDir/level12FM.sh
rm $workingDir/level13FM.sh

#rm -rf dictionaries
#rm README.md

## copy levels into new user folder
cp -r $workingDir/level1 /home/"$userName"/
cp -r $workingDir/level2 /home/"$userName"/
cp -r $workingDir/level3 /home/"$userName"/
cp -r $workingDir/level4 /home/"$userName"/
cp -r $workingDir/level5 /home/"$userName"/
cp -r $workingDir/level6 /home/"$userName"/
cp -r $workingDir/level7 /home/"$userName"/
cp -r $workingDir/level8 /home/"$userName"/
cp -r $workingDir/level9 /home/"$userName"/
cp -r $workingDir/level10 /home/"$userName"/
cp -r $workingDir/level11 /home/"$userName"/
cp -r $workingDir/level12 /home/"$userName"/
cp -r $workingDir/level13 /home/"$userName"/



## copy verify scripts into respective level directories
cp verifyFM.sh /home/"$userName"/level1/
cp verifyFM.sh /home/"$userName"/level2/
cp verifyFM.sh /home/"$userName"/level3/
cp verifyFM.sh /home/"$userName"/level4/
cp verifyFM.sh /home/"$userName"/level5/
cp verifyFM.sh /home/"$userName"/level6/
cp verifyFM.sh /home/"$userName"/level7/
cp verifyFM.sh /home/"$userName"/level8/
cp verifyFM.sh /home/"$userName"/level9/
cp verifyFM.sh /home/"$userName"/level10/
cp verifyFM.sh /home/"$userName"/level11/
cp verifyFM.sh /home/"$userName"/level12/
cp verifyFM.sh /home/"$userName"/level13/

## change permissions of levels to new user
chown -R $userName /home/$userName

## cleanup
clear

## print welcome message
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

