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

## add steps of 16 to each value to ensure no duplicate directory names are created
## 16 categories containing 16 items
## change the integer added to keep value in certain range while still being polymorphic
#pseudoRAND1=$((pseudoRAND1+16)) ## doesnt need changed
pseudoRAND2=$(( $pseudoRAND2 + 3 ))
pseudoRAND3=$(( $pseudoRAND3 + 14 ))
pseudoRAND4=$(( $pseudoRAND4 + 36 ))
pseudoRAND5=$(( $pseudoRAND5 + 54 ))
pseudoRAND6=$(( $pseudoRAND6 + 89 ))
pseudoRAND7=$(( $pseudoRAND7 + 119 ))
pseudoRAND8=$(( $pseudoRAND8 + 121 ))
pseudoRAND9=$(( $pseudoRAND9 + 139 ))
pseudoRAND10=$(( $pseudoRAND10 + 151 ))
pseudoRAND11=$(( $pseudoRAND11 + 176 ))
pseudoRAND12=$(( $pseudoRAND12 + 133 ))
pseudoRAND13=$(( $pseudoRAND13 + 201 ))
pseudoRAND14=$(( $pseudoRAND14 + 212 ))
pseudoRAND15=$(( $pseudoRAND15 + 231 ))
pseudoRAND16=$(( $pseudoRAND16 + 240 ))

## select target directory and name of file to be created by user
targetDirectory=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
createdFile=$(head -n $pseudoRAND16 masterArray.txt | tail -1)

## set directories based on pseudorands
dir1=$(head -n $pseudoRAND1 masterArray.txt | tail -1)
dir2=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
dir3=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
dir4=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
dir5=$(head -n $pseudoRAND5 masterArray.txt | tail -1)
dir6=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
dir7=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
dir8=$(head -n $pseudoRAND8 masterArray.txt | tail -1)
dir9=$(head -n $pseudoRAND9 masterArray.txt | tail -1)
dir10=$(head -n $pseudoRAND10 masterArray.txt | tail -1)
dir11=$(head -n $pseudoRAND11 masterArray.txt | tail -1)
dir12=$(head -n $pseudoRAND12 masterArray.txt | tail -1)
dir13=$(head -n $pseudoRAND13 masterArray.txt | tail -1)
dir14=$(head -n $pseudoRAND14 masterArray.txt | tail -1)
dir15=$(head -n $pseudoRAND15 masterArray.txt | tail -1)
dir16=$(head -n $pseudoRAND16 masterArray.txt | tail -1)

## create level-related directories
mkdir level5/
mkdir level5/"$dir1"
mkdir level5/"$dir2"
mkdir level5/"$dir3"
mkdir level5/"$dir4"
mkdir level5/"$dir5"
mkdir level5/"$dir6"
mkdir level5/"$dir7"
mkdir level5/"$dir8"
mkdir level5/"$dir9"
mkdir level5/"$dir10"
mkdir level5/"$dir11"
mkdir level5/"$dir12"
mkdir level5/"$dir13"
mkdir level5/"$dir14"
mkdir level5/"$dir15"
mkdir level5/"$dir16"

## generate file to be moved by user
echo "remove me" > level5/"$targetDirectory"/"$createdFile.txt"

## gen noise data





## create instruction set

echo "*"
echo "*"
echo "*"
echo "* Level 4" >> level5/README
echo "* Remove the file named $createdFile.txt in the $targetDirectory directory." >> level5/README
echo "* Once finished, run the verify.sh script." >> level5/README

rm directoryList.txt