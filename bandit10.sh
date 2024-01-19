#!/bin/sh
cd /root
. ./resources.sh
cd /home

## Create the files with the flag. 
# convert the level's password hash into base64, then copy the first 20 characters
# and store those in the file as the password.
# make lots of noise data - random binary stuff, then stick in
# ====== the
# ====== flag
# ====== is
# ====== this is where the password goes


cd /home/$levelToBuild
output_file="/home/$levelToBuild/data.txt"

create_binary_non_printable_file /home/$levelToBuild/partdata1.txt $((800 + $((RANDOM % 250)) ))
create_binary_non_printable_file /home/$levelToBuild/partdata2.txt $((800 + $((RANDOM % 250)) ))
create_binary_non_printable_file /home/$levelToBuild/partdata3.txt $((800 + $((RANDOM % 250)) ))
create_binary_non_printable_file /home/$levelToBuild/partdata4.txt $((800 + $((RANDOM % 250)) ))
create_binary_non_printable_file /home/$levelToBuild/partdata5.txt $((800 + $((RANDOM % 250)) ))

generate_base64_file /home/$levelToBuild/partwords1.txt $((40 + $((RANDOM % 10)) ))
generate_base64_file /home/$levelToBuild/partwords2.txt $((40 + $((RANDOM % 10)) ))
generate_base64_file /home/$levelToBuild/partwords3.txt $((40 + $((RANDOM % 10)) ))

message1="====== the"
message2="====== flag"
message3="====== is"
message4="====== "

cat partdata1.txt > data.txt
cat partwords1.txt >> data.txt
cat partwords2.txt >> data.txt
echo $message1 >> data.txt
cat partdata2.txt >> data.txt
echo $message2 >> data.txt
cat partdata3.txt >> data.txt
echo $message3 >> data.txt
cat partdata3.txt >> data.txt
echo -n $message4 >> data.txt
echo $level_HASH | base64 | tr -d "\r\n" | cut -c 1-20 >> data.txt
cat partdata4.txt >> data.txt
cat partwords3.txt >> data.txt
cat partdata5.txt >> data.txt

rm part*.txt

cd /home

## Create the README.txt file
levelinstructions="The flag for this level is stored in the file data.txt in one of the few human-readable strings, preceded by several '=' characters"
formatted_instructions=$(format_block "$levelinstructions")
echo "$formatted_instructions" >> /home/$readMeLocation
#set the permissions on the files in the home directory correctly
chown -R $levelToBuild:$levelToBuild /home/$levelToBuild
chmod -R o-rx /home/$levelToBuild