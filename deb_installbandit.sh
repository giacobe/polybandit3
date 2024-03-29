#!/bin/sh

# Set Passwords for the system and for each level
export SYSTEM_PASSWORD="systemPassword"
levelPasswordRoot="levelPassword"

# Eventually, we want this script to autorun from the /root user and prevent the participant from breaking out of it with <ctrl> C
#trap ' ' 2 20

# This sets the date/time correctly from the host system's date/time
export currentDate=$(date +"%m-%d-%Y" | head -n 1)

# Read the username from the keyboard.
# eventually, we need to do some validation that this at least looks like an email address
#export USER_ID=""
#echo "Enter your PSU email (xyz1234@psu.edu): "
#read USER_ID

confirmation="no"
while [[ "$confirmation" != "y" ]]
        do
                export USER_ID=""
                echo "Enter your email address (e.g. xyz1234@psu.edu): "
                read USER_ID
                read -p "Is $USER_ID your email address? (y/n)" confirmation
        done

# set the prompt to be the email address they just gave us
PS1='$USER_ID $'

export USER_HASH=$(echo -n "$USER_ID" | md5sum)
#not sure we need this
#echo -n "$USER_HASH" > userHash.txt

#set up the limited user accounts on the linux system that the end-user will be playing the game from
#set up the directories that are missing
mkdir /home
cp profile /etc

#create nextlevel and prevlevel commands to move between levels easily
cp nextlevel /usr/bin
cp prevlevel /usr/bin
chmod 755 /usr/bin/nextlevel
chmod 755 /usr/bin/prevlevel

#set the directory where the script is running from, so we can return to this location after each level's install script runs
export origInstallDir=$(pwd)

levelsetname="bandit"

# Call each level's install script

echo -n Building 10 levels [
for levelnumber in 1 2 3 4 5 6 7 8 9 10 11 12
#for levelnumber in 1 2 3 4 5 6 
do
        # set our variables
                #echo building $levelsetname
                echo -n "$levelnumber "
                export levelToBuild=$levelsetname$levelnumber
                newPass=$levelPasswordRoot$levelnumber
                export level_HASH=$(echo -n "$USER_ID$currentDate$SYSTEM_PASSWORD$newPass" | sha256sum | grep -o '^\S\+')
                export readMeLocation=$levelToBuild"/README.txt"
        #create level user account
                useradd -D -g "User" $levelToBuild
        #create the directory and set the password (to nothing) for the user's account
                passwd -d $levelToBuild > /dev/null 2>1&
        ## Create the README.txt file
                echo "* Create date: " $currentDate > /home/$readMeLocation
                echo "* User       : " $USER_ID >> /home/$readMeLocation
                echo "***************************************" >> /home/$readMeLocation
                echo "* Instructions for this level:        *" >> /home/$readMeLocation
        #launch the level's build script
                ./$levelsetname$levelnumber.sh&
        #set the permissions on the files in the home directory correctly
		# Moved this to the level build script to account for the & 
 #               chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
 #               chmod -R o-rx /home/$levelToBuild
        #return to the original installation directory
                cd $origInstallDir
        #get rid of our build script
        #rm $levelsetname$levelnumber.sh
done
echo ]
echo done

#rm setup.sh
#clear
#su -l bandit1 