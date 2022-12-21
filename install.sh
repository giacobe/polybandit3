#!/bin/sh

# Set Passwords for the system and for each level
export SYSTEM_PASSWORD="systemPassword"
levelPasswordRoot="levelPassword"

# Eventually, we want this script to autorun from the /root user and prevent the participant from breaking out of it with <ctrl> C
#trap ' ' 2 20

# This sets the date/time correctly from the host system's date/time
export currentDate=$(date +"%Y-%m-%d" | head -n 1)

# Read the username from the keyboard.
# eventually, we need to do some validation that this at least looks like an email address
export USER_ID=""
echo "Enter your PSU email (xyz1234@psu.edu): "
read USER_ID

export USER_HASH=$(echo -n "$USER_ID" | md5sum)
#not sure we need this
#echo -n "$USER_HASH" > userHash.txt

#set up the limited user accounts on the linux system that the end-user will be playing the game from
#set up the directories that are missing
mkdir /home
cp profile /etc

#set the directory where the script is running from, so we can return to this location after each level's install script runs
export origInstallDir=$(pwd)

# Call each level's install script

echo -n Building 10 levels [
for levelnumber in 1 2 3 4 5 6 7 8 9 10
do
	# set our variables
		levelsetname="basic"
		#echo building $levelsetname
		echo -n $levelnumber
		export levelToBuild=$levelsetname$levelnumber
		newPass=$levelPasswordRoot$levelnumber
		export level_HASH=$(echo -n "$USER_ID$currentDate$SYSTEM_PASSWORD$newPass" | sha256sum | grep -o '^\S\+')
		export readMeLocation=$levelToBuild"/README.txt"
	#create level user account
		adduser -D -g "User" $levelToBuild
	#create the directory and set the password (to nothing) for the user's account
		passwd -d $levelToBuild > /dev/null 2>1&
	#launch the level's build script
		./$levelsetname$levelnumber.sh
	#set the permissions on the files in the home directory correctly
		chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
		chmod -R o-rx /home/$levelToBuild
	## Create the README.txt file
		echo "*" > $readMeLocation
		echo "*   You created this session on:     *" >> $readMeLocation
		echo "*             " $currentDate >> $readMeLocation
		echo "*   for user: " $USER_ID >> $readMeLocation
		echo "**************************************" >> $readMeLocation
	#return to the original installation directory
		cd $origInstallDir
	#get rid of our build script
	#rm $levelsetname$levelnumber.sh
done
echo ]
echo done

#rm setup.sh
clear
su -l basic1
