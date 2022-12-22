#!/bin/sh
PS1='\W$ '
cd ~
clear
echo "********************************************************************************"
echo "*  Welcome to The PolyLinux Game. Follow the instructions in the README.txt    *"
echo "*  file to figure out the password to complete the level. To change to another *"
echo "*  level you can issue the command 'su - basic#' where # is the level number   *"
echo "*  (1-10).  e.g. su - $USER will get you back to this level.  Good luck!"
echo "********************************************************************************"
echo "* Level      : " $USER >> /home/$readMeLocation
cat README.txt
