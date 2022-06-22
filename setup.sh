#!/bin/bash
#trap ' ' 2 20
rc-update delete hwclock boot
rc-service hwclock restart
date +"%Y-%m-%d" > currentDate.txt
currentDate=$(head -n 1 currentDate.txt)
USER_ID=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read -r USER_ID
echo -n "$USER_ID" > userID.txt
USER_HASH=$(echo -n "$USER_ID$currentDate" | md5sum)
echo -n "$USER_HASH" > userHash.txt

userName="polylinuxgame"
newPass="Password1"
useradd -p $newPass -m $userName

bash level1.sh
bash level2.sh
bash level3.sh
bash level4.sh
bash level5.sh
bash level6.sh
bash level7.sh
bash level8.sh
bash level9.sh
bash level10.sh

rm level1.sh
rm level2.sh
rm level3.sh
rm level4.sh
rm level5.sh
rm level6.sh
rm level7.sh
rm level8.sh
rm level9.sh
rm level10.sh

rm -rf dictionaries
rm README.md
rm userHash.txt
cp -r /root/PolyLinuxGame/* /home/"$userName"/
rm /home/polylinuxgame/level1Verify.sh
rm /home/polylinuxgame/level2Verify.sh
rm /home/polylinuxgame/level3Verify.sh
rm /home/polylinuxgame/level4Verify.sh
rm /home/polylinuxgame/level5Verify.sh
rm /home/polylinuxgame/level6Verify.sh
rm /home/polylinuxgame/level7Verify.sh
rm /home/polylinuxgame/level8Verify.sh
rm /home/polylinuxgame/level9Verify.sh
rm /home/polylinuxgame/level10Verify.sh
#rm /home/polylinuxgame/directoryList.txt
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
echo "*    You created this session on:     *"
echo "*             $currentDate              *"
echo "***************************************"
su -l $userName
#sleep 10