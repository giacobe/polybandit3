#!/bin/sh

## grab chars from hash
pseudoRANDcapture1=${USER_HASH:2:1}
pseudoRANDcapture2=${USER_HASH:3:1}
pseudoRANDcapture3=${USER_HASH:4:1}
pseudoRANDcapture4=${USER_HASH:5:1}
pseudoRANDcapture5=${USER_HASH:6:1}
pseudoRANDcapture6=${USER_HASH:7:1}
#pseudoRANDcapture7=${USER_HASH:8:1}
#pseudoRANDcapture8=${USER_HASH:9:1}
#pseudoRANDcapture9=${USER_HASH:10:1}
#pseudoRANDcapture10=${USER_HASH:11:1}
#pseudoRANDcapture11=${USER_HASH:12:1}
#pseudoRANDcapture12=${USER_HASH:13:1}
#pseudoRANDcapture13=${USER_HASH:14:1}
#pseudoRANDcapture14=${USER_HASH:15:1}
#pseudoRANDcapture15=${USER_HASH:16:1}
#pseudoRANDcapture16=${USER_HASH:17:1}

## convert hash character from hex to decimal
pseudoRAND1=$(echo "ibase=16; $pseudoRANDcapture1" | bc)
pseudoRAND2=$(echo "ibase=16; $pseudoRANDcapture2" | bc)
pseudoRAND3=$(echo "ibase=16; $pseudoRANDcapture3" | bc)
pseudoRAND4=$(echo "ibase=16; $pseudoRANDcapture4" | bc)
pseudoRAND5=$(echo "ibase=16; $pseudoRANDcapture5" | bc)
pseudoRAND6=$(echo "ibase=16; $pseudoRANDcapture6" | bc)


## adds one to handle hash values of 0
## in this more complex level, the names of the directories are handled differently
pseudoRAND1=$(( $pseudoRAND1 + 1 ))
pseudoRAND2=$(( $pseudoRAND2 + 1 ))
pseudoRAND3=$(( $pseudoRAND3 + 1 ))
pseudoRAND4=$(( $pseudoRAND4 + 1 ))
pseudoRAND5=$(( $pseudoRAND5 + 1 ))


## based on the first character of the hash, select which set of 16 items should be chosen from masterArray
case "$pseudoRAND5" in
    "1") dictSelect=1   # airlines   
    ;;
    "2") dictSelect=17  # appliances
    ;;
    "3") dictSelect=33  # candy
    ;;
    "4") dictSelect=49  # car brands
    ;;
    "5") dictSelect=65  # cheese
    ;;
    "6") dictSelect=81  # cities
    ;;
    "7") dictSelect=97  # clothing brands
    ;;
    "8") dictSelect=113 # colleges
    ;;
    "9") dictSelect=129 # countries
    ;;
    "10") dictSelect=145    # letters
    ;;
    "11") dictSelect=161    # dog breeds
    ;;
    "12") dictSelect=177    # fast food
    ;;
    "13") dictSelect=193    # fruits
    ;;
    "14") dictSelect=209    # instruments
    ;;
    "15") dictSelect=225    # music artists
    ;;
    "16") dictSelect=241    # sports
    ;;
esac


## endRange adds 16 to get 15 directories the same plus 1 different directory at the tail
endRange=$(( $dictSelect + 16 ))
sed -n "$dictSelect","$endRange"p masterArray.txt > dirList.txt

## select name of file to be created by user
targetDirectory=$(head -n $pseudoRAND2 masterArray.txt | tail -1)

## set directories based on pseudorands
dir1=$(head -n 1 dirList.txt | tail -1)
dir2=$(head -n 2 dirList.txt | tail -1)
dir3=$(head -n 3 dirList.txt | tail -1)
dir4=$(head -n 4 dirList.txt | tail -1)
dir5=$(head -n 5 dirList.txt | tail -1)


## create level-related directories
mkdir level8/
mkdir level8/"$dir1"
mkdir level8/"$dir2"
mkdir level8/"$dir3"
mkdir level8/"$dir4"
mkdir level8/"$dir5"

## jumble names using hashing
noiseData1=$(echo "$dir1" | md5sum | base64)
noiseData2=$(echo "$dir2" | md5sum | base64)
noiseData3=$(echo "$dir3" | md5sum | base64)
noiseData4=$(echo "$dir4" | md5sum | base64)
noiseData5=$(echo "$dir5" | md5sum | base64)

#createdFile=$(head -n $pseudoRAND9 masterArray.txt | tail -1)
targetFile=$(head -n $pseudoRAND3 masterArray.txt | tail -1 | md5sum | base64)
touch -t 202201010232 level8/"$targetDirectory"/"$targetFile".log
#touch -t 202201010232 testFile
## make noise files -- touch -t 2022-01-01-0:2:30
touch -t 202201010132 level8/"$dir1"/$noiseData1.log
touch -t 202201010133 level8/"$dir1"/$noiseData2.log
touch -t 202201010734 level8/"$dir1"/$noiseData3.log
touch -t 202201010935 level8/"$dir1"/$noiseData4.log
touch -t 202201010736 level8/"$dir1"/$noiseData5.log

touch -t 202201010130 level8/"$dir2"/"$noiseData1".log
touch -t 202201010130 level8/"$dir2"/"$noiseData2".log
touch -t 202201010730 level8/"$dir2"/"$noiseData3".log
touch -t 202201010930 level8/"$dir2"/"$noiseData4".log
touch -t 202201010730 level8/"$dir2"/"$noiseData5".log

touch -t 202201010130 level8/"$dir3"/"$noiseData1".log
touch -t 202201010130 level8/"$dir3"/"$noiseData2".log
touch -t 202201010730 level8/"$dir3"/"$noiseData3".log
touch -t 202201010930 level8/"$dir3"/"$noiseData4".log
touch -t 202201010730 level8/"$dir3"/"$noiseData5".log

touch -t 202201010130 level8/"$dir4"/"$noiseData1".log
touch -t 202201010130 level8/"$dir4"/"$noiseData2".log
touch -t 202201010730 level8/"$dir4"/"$noiseData3".log
touch -t 202201010930 level8/"$dir4"/"$noiseData4".log
touch -t 202201010730 level8/"$dir4"/"$noiseData5".log

touch -t 202201010130 level8/"$dir5"/"$noiseData1".log
touch -t 202201010130 level8/"$dir5"/"$noiseData2".log
touch -t 202201010730 level8/"$dir5"/"$noiseData3".log
touch -t 202201010930 level8/"$dir5"/"$noiseData4".log
touch -t 202201010730 level8/"$dir5"/"$noiseData5".log
## create instruction set

echo "Last night, our incident response team detected an attack on our network. " >> level8/README
echo "They need your help locating the log file containing the attacker's IP address. " >> level8/README
echo "Your supervisor tells you the attack happened between 2:30am and 3:00am, and that " >> level8/README
echo "the log file is in the $targetDirectory, but due to an error in the logging system, " >> level8/README
echo "the names of the log files are jumbled. Can you locate and delete the correct log file? " >> level8/README
echo "( cd Hint: explore the ls command flags using ' ls--help ' ) " >> level8/README
echo "* Once finished, run the verify.sh script." >> level8/README

rm dirList.txt