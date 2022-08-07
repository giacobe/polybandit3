#!/bin/sh

## grab chars from hash
pseudoRANDcapture1=${USER_HASH:2:1}
pseudoRANDcapture2=${USER_HASH:3:1}
pseudoRANDcapture3=${USER_HASH:4:1}
pseudoRANDcapture4=${USER_HASH:5:1}
pseudoRANDcapture5=${USER_HASH:6:1}
pseudoRANDcapture6=${USER_HASH:7:1}
pseudoRANDcapture7=${USER_HASH:8:1}
pseudoRANDcapture8=${USER_HASH:9:1}
pseudoRANDcapture9=${USER_HASH:10:1}
pseudoRANDcapture10=${USER_HASH:11:1}
pseudoRANDcapture11=${USER_HASH:12:1}
pseudoRANDcapture12=${USER_HASH:13:1}
pseudoRANDcapture13=${USER_HASH:14:1}
pseudoRANDcapture14=${USER_HASH:15:1}
pseudoRANDcapture15=${USER_HASH:16:1}
pseudoRANDcapture16=${USER_HASH:17:1}

## convert hash character from hex to decimal
pseudoRAND1=$(echo "ibase=16; $pseudoRANDcapture1" | bc)
pseudoRAND2=$(echo "ibase=16; $pseudoRANDcapture2" | bc)
pseudoRAND3=$(echo "ibase=16; $pseudoRANDcapture3" | bc)
pseudoRAND4=$(echo "ibase=16; $pseudoRANDcapture4" | bc)
pseudoRAND5=$(echo "ibase=16; $pseudoRANDcapture5" | bc)
pseudoRAND6=$(echo "ibase=16; $pseudoRANDcapture6" | bc)
pseudoRAND7=$(echo "ibase=16; $pseudoRANDcapture7" | bc)
pseudoRAND8=$(echo "ibase=16; $pseudoRANDcapture8" | bc)
pseudoRAND9=$(echo "ibase=16; $pseudoRANDcapture9" | bc)
pseudoRAND10=$(echo "ibase=16; $pseudoRANDcapture10" | bc)
pseudoRAND11=$(echo "ibase=16; $pseudoRANDcapture11" | bc)
pseudoRAND12=$(echo "ibase=16; $pseudoRANDcapture12" | bc)
pseudoRAND13=$(echo "ibase=16; $pseudoRANDcapture13" | bc)
pseudoRAND14=$(echo "ibase=16; $pseudoRANDcapture14" | bc)
pseudoRAND15=$(echo "ibase=16; $pseudoRANDcapture15" | bc)
pseudoRAND16=$(echo "ibase=16; $pseudoRANDcapture16" | bc)

## adds one to handle hash values of 0
## in this more complex level, the names of the directories are handled differently
pseudoRAND1=$(( $pseudoRAND1 + 1 ))
pseudoRAND2=$(( $pseudoRAND2 + 1 ))
pseudoRAND3=$(( $pseudoRAND3 + 1 ))
pseudoRAND4=$(( $pseudoRAND4 + 1 ))
pseudoRAND5=$(( $pseudoRAND5 + 1 ))
pseudoRAND6=$(( $pseudoRAND6 + 1 ))
pseudoRAND7=$(( $pseudoRAND7 + 1 ))
pseudoRAND8=$(( $pseudoRAND8 + 1 ))
pseudoRAND9=$(( $pseudoRAND9 + 1 ))
pseudoRAND10=$(( $pseudoRAND10 + 1 ))
pseudoRAND11=$(( $pseudoRAND11 + 1 ))
pseudoRAND12=$(( $pseudoRAND12 + 1 ))
pseudoRAND13=$(( $pseudoRAND13 + 1 ))
pseudoRAND14=$(( $pseudoRAND14 + 1 ))
pseudoRAND15=$(( $pseudoRAND15 + 1 ))
pseudoRAND16=$(( $pseudoRAND16 + 1 ))

## based on the first character of the hash, select which set of 16 items should be chosen from masterArray
case "$pseudoRAND12" in
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
createdDir=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
targetDirectory=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
secondTargetDirectory=$(head -n $pseudoRAND11 masterArray.txt | tail -1)

## set directories based on pseudorands
dir1=$(head -n 1 dirList.txt | tail -1)
dir2=$(head -n 2 dirList.txt | tail -1)
dir3=$(head -n 3 dirList.txt | tail -1)
dir4=$(head -n 4 dirList.txt | tail -1)
dir5=$(head -n 5 dirList.txt | tail -1)
dir6=$(head -n 6 dirList.txt | tail -1)
dir7=$(head -n 7 dirList.txt | tail -1)
dir8=$(head -n 8 dirList.txt | tail -1)
dir9=$(head -n 9 dirList.txt | tail -1)
dir10=$(head -n 10 dirList.txt | tail -1)
dir11=$(head -n 11 dirList.txt | tail -1)
dir12=$(head -n 12 dirList.txt | tail -1)
dir13=$(head -n 13 dirList.txt | tail -1)
dir14=$(head -n 14 dirList.txt | tail -1)
dir15=$(head -n 15 dirList.txt | tail -1)
dir16=$(head -n 17 dirList.txt | tail -1)

## create level-related directories
mkdir level7/
mkdir level7/"$dir1"
mkdir level7/"$dir2"
mkdir level7/"$dir3"
mkdir level7/"$dir4"
mkdir level7/"$dir5"
mkdir level7/"$dir6"
mkdir level7/"$dir7"
mkdir level7/"$dir8"
mkdir level7/"$dir9"
mkdir level7/"$dir10"
mkdir level7/"$dir11"
mkdir level7/"$dir12"
mkdir level7/"$dir13"
mkdir level7/"$dir14"
mkdir level7/"$dir15"
mkdir level7/"$dir16"

## create instruction set
echo "* Level 7" >> level7/README
echo "Create a new file named $createdDir.txt in the directory unlike the others." >> level7/README
echo "Then, create a new directory named $targetDirectory, with the subdirectory '$secondTargetDirectory'. " >> level7/README
echo "(Hint: use a flag with the command.)" >> level7/README
echo "Once finished, run the verify.sh script." >> level7/README

rm dirList.txt

