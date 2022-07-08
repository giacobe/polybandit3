#!/bin/sh

## list all directories and subdirectories
checkDir=$(ls -R "/home/polylinuxgame/level6")

## find all files in level, add to file; adds file path per line
find "/home/polylinuxgame/level6" -type f > fileList.txt

## for line in fileList:
while read -r line
do
  temp=$(cat "$line")
  checkDir=$checkDir$temp
done < fileList.txt


## concatenate USER_HASH with all files and directories, hash it, then convert to
## base64 characters for human-readable output
finalHash=$(echo "$USER_HASH$checkDir" | md5sum | base64)
echo "*"
echo "*"
echo "*"
echo "Take this string and input it in the grading system. Be sure to copy it exactly!"
## snip first ten characters for output
echo "${finalHash:0:10}"
rm fileList.txt