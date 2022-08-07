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
pseudoRAND1=$(( $pseudoRAND1 + 1 )) ## ensures value isn't 0
pseudoRAND2=$(( $pseudoRAND2 + 4 ))
pseudoRAND3=$(( $pseudoRAND3 + 12 ))
pseudoRAND4=$(( $pseudoRAND4 + 45 ))
pseudoRAND5=$(( $pseudoRAND5 + 61 ))
pseudoRAND6=$(( $pseudoRAND6 + 87 ))
pseudoRAND7=$(( $pseudoRAND7 + 109 ))
pseudoRAND8=$(( $pseudoRAND8 + 116 ))
pseudoRAND9=$(( $pseudoRAND9 + 131 ))
pseudoRAND10=$(( $pseudoRAND10 + 153 ))
pseudoRAND11=$(( $pseudoRAND11 + 167 ))
pseudoRAND12=$(( $pseudoRAND12 + 136 ))
pseudoRAND13=$(( $pseudoRAND13 + 195 ))
pseudoRAND14=$(( $pseudoRAND14 + 210 ))
pseudoRAND15=$(( $pseudoRAND15 + 223 ))
pseudoRAND16=$(( $pseudoRAND16 + 236 ))

## select target directory and name of file to be created by user
targetDirectory=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
secondTargetDirectory=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
createdFile=$(head -n $pseudoRAND14 masterArray.txt | tail -1)

## set directories based on pseudorands
dir1=$(head -n $pseudoRAND1 masterArray.txt | tail -1)
dir2=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
dir3=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
dir4=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
dir5=$(head -n $pseudoRAND5 masterArray.txt | tail -1)
dir6=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
dir7=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
dir8=$(head -n $pseudoRAND8 masterArray.txt | tail -1)


## create level-related directories
mkdir level3/
mkdir level3/"$dir1"
mkdir level3/"$dir2"
mkdir level3/"$dir3"
mkdir level3/"$dir4"
mkdir level3/"$dir5"
mkdir level3/"$dir6"
mkdir level3/"$dir7"
mkdir level3/"$dir8"
#mkdir level3/"$dir9"
#mkdir level3/"$dir10"
#mkdir level3/"$dir11"
#mkdir level3/"$dir12"
#mkdir level3/"$dir13"
#mkdir level3/"$dir14"
#mkdir level3/"$dir15"
#mkdir level3/"$dir16"

## generate file to be moved by user
touch level3/"$targetDirectory"/"$createdFile.txt"

## gen noise data

noiseData1=$(head -n $pseudoRAND1 masterArray.txt | tail -1)
noiseData2=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
noiseData3=$(head -n $pseudoRAND9 masterArray.txt | tail -1)
noiseData4=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
noiseData5=$(head -n $pseudoRAND15 masterArray.txt | tail -1)
noiseData6=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
noiseData7=$(head -n $pseudoRAND13 masterArray.txt | tail -1)
noiseData8=$(head -n $pseudoRAND11 masterArray.txt | tail -1)


touch level3/"$dir1"/"$noiseData1".csv
touch level3/"$dir1"/"$noiseData2".cab
touch level3/"$dir1"/"$noiseData3".iso
touch level3/"$dir1"/"$noiseData4".jar
touch level3/"$dir1"/"$noiseData5".iso
touch level3/"$dir1"/"$noiseData6".html
touch level3/"$dir1"/"$noiseData7".lnk
touch level3/"$dir1"/"$noiseData8".doc

touch level3/"$dir2"/"$noiseData1".log
touch level3/"$dir2"/"$noiseData2".docx
touch level3/"$dir2"/"$noiseData3".huh
touch level3/"$dir2"/"$noiseData4".dat
touch level3/"$dir2"/"$noiseData5".txt
touch level3/"$dir2"/"$noiseData6".rar
touch level3/"$dir2"/"$noiseData7".txt
touch level3/"$dir2"/"$noiseData8".txt

touch level3/"$dir3"/"$noiseData1".txt
touch level3/"$dir3"/"$noiseData2".csv
touch level3/"$dir3"/"$noiseData3".txt
touch level3/"$dir3"/"$noiseData4".txt
touch level3/"$dir3"/"$noiseData5".csv
touch level3/"$dir3"/"$noiseData6".yeet
touch level3/"$dir3"/"$noiseData7".txt
touch level3/"$dir3"/"$noiseData8".txt

touch level3/"$dir4"/"$noiseData1".jpeg
touch level3/"$dir4"/"$noiseData2".iso
touch level3/"$dir4"/"$noiseData3".rar
touch level3/"$dir4"/"$noiseData4".fortnite
touch level3/"$dir4"/"$noiseData5".rar
touch level3/"$dir4"/"$noiseData6".log
touch level3/"$dir4"/"$noiseData7".dat
touch level3/"$dir4"/"$noiseData8".dat

touch level3/"$dir5"/"$noiseData1".csv
touch level3/"$dir5"/"$noiseData2".txt
touch level3/"$dir5"/"$noiseData3".txt
touch level3/"$dir5"/"$noiseData4".txt
touch level3/"$dir5"/"$noiseData5".txt
touch level3/"$dir5"/"$noiseData6".txt
touch level3/"$dir5"/"$noiseData7".csv
touch level3/"$dir5"/"$noiseData8".csv

touch level3/"$dir6"/"$noiseData1".mov
touch level3/"$dir6"/"$noiseData2".txt
touch level3/"$dir6"/"$noiseData3".txt
touch level3/"$dir6"/"$noiseData4".txt
touch level3/"$dir6"/"$noiseData5".mov
touch level3/"$dir6"/"$noiseData6".dat
touch level3/"$dir6"/"$noiseData7".dat
touch level3/"$dir6"/"$noiseData8".mov

touch level3/"$dir7"/"$noiseData1".css
touch level3/"$dir7"/"$noiseData2".css
touch level3/"$dir7"/"$noiseData3".html
touch level3/"$dir7"/"$noiseData4".html
touch level3/"$dir7"/"$noiseData5".html
touch level3/"$dir7"/"$noiseData6".html
touch level3/"$dir7"/"$noiseData7".html
touch level3/"$dir7"/"$noiseData8".html

touch level3/"$dir8"/"$noiseData1".txt
touch level3/"$dir8"/"$noiseData2".txt
touch level3/"$dir8"/"$noiseData3".txt
touch level3/"$dir8"/"$noiseData4".txt
touch level3/"$dir8"/"$noiseData5".dmg
touch level3/"$dir8"/"$noiseData6".dmg
touch level3/"$dir8"/"$noiseData7".dmg
touch level3/"$dir8"/"$noiseData8".dmg



## create instruction set
echo "* Level 3 ">> level3/README
echo "Copy the file named $createdFile.txt in the $targetDirectory directory" >> level3/README
echo "into the $secondTargetDirectory directory." >> level3/README
echo "Once finished, run the verify.sh script." >> level3/README

