#!/bin/sh

# Eventually, we want this script to autorun from the /root user and prevent the participant from breaking out of it with <ctrl> C
#trap ' ' 2 20

# This sets the date/time correctly from the hosty system's date/time
#rc-update delete hwclock boot
#rc-service hwclock restart
#date +"%Y-%m-%d" > currentDate.txt
export currentDate=$(date +"%Y-%m-%d" | head -n 1)

# Read the username from the keyboard.
# eventually, we need to do some validation that this at least looks like an email address
export USER_ID=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read USER_ID

# why exactly are we doing this?!?
#echo -n "$USER_ID" > userID.txt

export USER_HASH=$(echo -n "$USER_ID" | md5sum)
echo -n "$USER_HASH" > userHash.txt

#set up the limited user account on the linux system that the end-user will be playing the game from
# this sets up the user account for the game
export userName="polylinuxgame"
export newPass="Password1"
#useradd -p $newPass -m $userName #(wrong syntax for Buildroot/ash)
#set up the directories that are missing
mkdir /home
mkdir /home/$userName
adduser -h /home/$username -D -g "User" $userName
chown $userName:$userName /home/$userName

export origInstallDir=$(pwd)

# Call each level's install script
# remove each level's install script since we don't need it anymore

echo building basic1
./basic1.sh
cd $origInstallDir
#rm basic1.sh

echo building basic2
./basic2.sh
cd $origInstallDir
#rm basic2.sh

echo building basic3
./basic3.sh
cd $origInstallDir
#rm basic3.sh

echo building basic4
./basic4.sh
cd $origInstallDir
#rm basic4.sh

echo building basic5
./basic5.sh
cd $origInstallDir
#rm basic5.sh

echo building basic6
./basic6.sh
cd $origInstallDir
#rm basic6.sh

echo building basic7
./basic7.sh
cd $origInstallDir
#rm basic7.sh

echo building basic8
./basic8.sh
cd $origInstallDir
#rm basic8.sh

echo building basic9
./basic9.sh
cd $origInstallDir
#rm basic9.sh

echo building basic10
./basic10.sh
cd $origInstallDir
#rm basic10.sh

#echo building level1
#./level1.sh
#cd $origInstallDir
#rm level1.sh

#echo building level2
#./level2.sh
#cd $origInstallDir
#rm level2.sh

#echo building level3
#./level3.sh
#cd $origInstallDir
#rm level3.sh

#echo building level4
#./level4.sh
#cd $origInstallDir
#rm level4.sh

#clean up after ourselves
#rm -rf dictionaries
#rm README.md
#rm userHash.txt

# why?  Oh, I guess we originally generated this all in the /root directory. Fixed this later by doing a CD to the correct directory in each level's .sh
#cp -r /root/PolyLinuxGame/* /home/$userName/

# why are we removing these?
#rm /home/polylinuxgame/level1Verify.sh
#rm /home/polylinuxgame/level2Verify.sh
#rm /home/polylinuxgame/level3Verify.sh
#rm /home/polylinuxgame/level4Verify.sh
#rm -rf /root/PolyLinuxGame
#cp -r /root/PolyLinuxGame/dictionaries /home/$userName/

# clean up the ownership the files in the gameplayer's homedir. might need to add a group as well
chown -R $userName /home/$userName

#clear

#rm setup.sh
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
su -l $userName
#sleep 10
