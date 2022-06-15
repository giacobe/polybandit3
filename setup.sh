#!/bin/bash
#trap ' ' 2 20

currentDate=$(date +"%Y-%m-%d")
USER_ID=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read USER_ID
USER_HASH=$(echo -n "$USER_ID$currentDate" | md5sum)
echo -n "$USER_HASH" > userHash.txt

userName="polylinuxgame"
newPass="Password1"
useradd -p $newPass -m $userName

bash level1.sh
bash level2.sh
bash level3.sh
bash level4.sh

rm level1.sh
rm level2.sh
rm level3.sh
rm level4.sh
rm -rf dictionaries
rm README.md
rm userHash.txt
cp -r /root/PolyLinuxGame/* /home/$userName/

rm -rf /root/PolyLinuxGame
#cp -r /root/PolyLinuxGame/dictionaries /home/$userName/
chown -R $userName /home/polylinuxgame

clear

#rm setup.sh
echo "Done!" 
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Change to different directories    *"
echo "*  and use 'cat README.txt' to read   *"
echo "*   the instructions for the level    *"
echo "*             Good Luck!              *"
echo "***************************************"
su -l $userName
#sleep 10