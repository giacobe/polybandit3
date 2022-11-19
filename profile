#!/bin/sh
PS1='\W$ '
cd ~

clear
echo "***************************************"
echo "*   Welcome to The PolyLinux Game     *"
echo "*      You are on level $USER     *"
echo "*  Follow the instructions in the     *"
echo "*  README.txt file to figure out how  *"
echo "*  to complete the level. To change   *"
echo "*  to another level you can type:     *"
echo "*            su -l basic#             *"
echo "*   Where # is a number from 1-10     *"
echo "*                                     *"
echo "*             Good Luck!              *"
echo "*    You created this session on:     *"
echo "*             $currentDate              *"
echo "***************************************"

cat README.txt
