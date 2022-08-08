#!/bin/sh

#set and confirm inputs
levelPassword="level6password"
levelToBuild="level6"
readMeLocation=$levelToBuild"/README.txt"

level_HASH=$(echo -n "$USER_ID$currentDate$newPass$levelPassword" | md5sum | grep -o '^\S\+' | base64 | cut -c 1-8)

#Create level contents
mkdir $levelToBuild

cd $levelToBuild

#create readme.txt

echo "***************************************" > README.txt
echo "*   Welcome to Level 6 of The PolyLinux Game     *" >> README.txt
echo "*             Good Luck!              *" >> README.txt
echo "*    You created this session on:     *" >> README.txt
echo "*             $currentDate            *" >> README.txt
echo "***************************************" >> README.txt
echo "*Use the find command to discover the password inside of a file called inhere.txt*" >> README.txt

#create level contents


#---- DATA LEAK ISSUE ----


#create the first directory
mkdir Disney
cd Disney
echo "This location is not what you were looking for" > Parks.txt
echo "This location is not what you were looking for" > Castle.txt
echo "This location is not what you were looking for" > FireWorks.txt
#-------------------------------------- Start of Directory Stays in
mkdir StarWars
cd StarWars
echo "This location is not what you were looking for" > Vader.txt
echo "This location is not what you were looking for" > Skywalker.txt
echo "This location is not what you were looking for" > Revan.txt
cd ..
#------------------------------------------------- Back in Disney
mkdir ToyStory
cd ToyStory
echo "This location is not what you were looking for" > Buzz.txt
echo "This location is not what you were looking for" > Woody.txt
echo "This location is not what you were looking for" > Toys.txt
cd ..
#--------------------------------------------------- Back to Disney
mkdir MonstersInc
cd MonstersInc
echo "This location is not what you were looking for" > Mike.txt
echo "This location is not what you were looking for" > Sully.txt
echo "This location is not what you were looking for" > Boo.txt
cd ..
cd ..
##--------------------------------------------------- Back to Main Directory
mkdir Netflix
cd Netflix
echo "This location is not what you were looking for" > Movies.txt
echo "This location is not what you were looking for" > TV.txt
echo "This location is not what you were looking for" > StandUp.txt

#-------------------------------------- Stay in Netflix
mkdir BreakingBad
cd BreakingBad
echo "This location is not what you were looking for" > Walter.txt
echo "This location is not what you were looking for" > Gus.txt
echo "This location is not what you were looking for" > Jessie.txt
cd ..
#-------------------------------------- Stay in Netflix
mkdir Narcos
cd Narcos
echo "This location is not what you were looking for" > Steve.txt
echo "This location is not what you were looking for" > Javier.txt
echo "This location is not what you were looking for" > Pablo.txt
cd ..
#-------------------------------------- Stay in Netflix
mkdir PeakyBlinders
cd PeakyBlinders
echo "This location is not what you were looking for" > Tommy.txt
echo "This location is not what you were looking for" > Alfie.txt
echo "This location is not what you were looking for" > Finn.txt
cd ..
cd ..
#-------------------------------------- End of Directory
mkdir Comedians
cd Comedians
echo "This location is not what you were looking for" > BillBurr.txt
echo "This location is not what you were looking for" > KevinHart.txt
echo "This location is not what you were looking for" > Fluffy.txt
echo "This location is not what you were looking for" > RobinWilliams.txt
#Temporary Point to where I need to be
cd ..
#-------------------------------------- End of Directory
mkdir Comedies
cd Comedies
echo "This location is not what you were looking for" > FreeGuy.txt
echo "This location is not what you were looking for" > Minions.txt
echo "$level_HASH" > inhere.txt
echo "This location is not what you were looking for" > TheOffice.txt
cd ..
