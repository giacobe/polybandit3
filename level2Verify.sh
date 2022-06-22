#!/bin/bash
USER_ID=$(head -n 1 "$HOME"/userID.txt)
currentDate=$(head -n 1 "$HOME"/currentDate.txt)
USER_HASH=${USER_HASH:0:32}
levelToCheck=$HOME/level2
checkDir=$(ls -R "$levelToCheck")
find "$levelToCheck" -type f > fileList.txt
declare -a list
readarray -t list <fileList.txt
for i in ${list[$i]}
do
    checkDir+=$(cat "$i")
done
finalHash=$(echo -n "$USER_ID$checkDir$currentDate" | md5sum | base64)
echo "$finalHash" > finalHash.txt
finalHash=$(cut -c 1-32 finalHash.txt)
echo "*"
echo "*"
echo "*"
echo "Take this string and input it in the grading system. Be sure to copy it exactly!"
echo "${finalHash:0:10}"
rm finalHash.txt fileList.txt
