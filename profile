#!/bin/sh
PS1='\W$ '
cd ~
clear
echo "********************************************************************************"
echo "*  Welcome to The PolyLinux Game. Follow the instructions in the README.txt    *"
echo "*  file to figure out the password to complete the level.                      *"
echo "*  To change to next level, issue the command 'nextlevel'.                     *"
echo "*  To change to next previous level, issue the command 'prevlevel'.            *"
echo "********************************************************************************"
echo "* Level      : " $USER
cat README.txt
