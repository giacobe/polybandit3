#!/bin/sh
PS1='\W$ '
cd ~
currentDate=$(date +"%Y-%m-%d" | head -n 1)
clear
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*  Follow the instructions in the     *"
echo "*  README.txt file to figure out how  *"
echo "*  to complete the level. To change   *"
echo "*  to another level you can type:     *"
echo "*            su - basic#              *"
echo "*  Substitute # with a number (1-10)  *"
echo "*  e.g. su - $USER will get you back"
echo "*  to this level.                     *"
echo "*             Good Luck!              *"
echo "*    You created this session on:     *"
echo "             $currentDate"
echo "***************************************"
echo "* You are on level $USER. Instructions:
cat README.txt
