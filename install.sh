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
#export userName="polylinuxgame"
#export newPass="Password1"
#useradd -p $newPass -m $userName #(wrong syntax for Buildroot/ash)
#set up the directories that are missing
mkdir /home
cp profile /etc
#mkdir /home/$userName
#adduser -h /home/$userName -D -g "User" $userName
#chown $userName:$userName /home/$userName

export origInstallDir=$(pwd)

# Call each level's install script
# remove each level's install script since we don't need it anymore

echo building basic1
#create level user account
export userName="basic1"
export newPass="basic1"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic1.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic1.sh

echo building basic2
#create level user account
export userName="basic2"
export newPass="basic2"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic2.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic2.sh

echo building basic3
#create level user account
export userName="basic3"
export newPass="basic3"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic3.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic3.sh

echo building basic4
#create level user account
export userName="basic4"
export newPass="basic4"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic4.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic4.sh

echo building basic5
#create level user account
export userName="basic5"
export newPass="basic5"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic5.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic5.sh

echo building basic6
#create level user account
export userName="basic6"
export newPass="basic6"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic6.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic6.sh

echo building basic7
#create level user account
export userName="basic7"
export newPass="basic7"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic7.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic7.sh

echo building basic8
#create level user account
export userName="basic8"
export newPass="basic8"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic8.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic8.sh

echo building basic9
#create level user account
export userName="basic9"
export newPass="basic9"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic9.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic9.sh

echo building basic10
#create level user account
export userName="basic10"
export newPass="basic10"
#create the directory to start from
#mkdir /home/$userName
adduser -D -g "User" $userName
passwd -d $userName
./basic10.sh
chown -R $userName:$userName /home/$userName
chmod -R o-rx /home/$userName
cd $origInstallDir
#rm basic10.sh

# clean up the ownership the files in the gameplayer's homedir. might need to add a group as well
#chown -R $userName /home/$userName

#clear

#rm setup.sh
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
su -l basic1
#sleep 10
