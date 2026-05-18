#!/bin/sh
PS1='\W$ '
dmesg -n1
cd ~
clear
./install.sh
