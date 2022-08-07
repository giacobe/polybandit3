#!/bin/sh 

## paste level

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

## add steps of 16 to each value to ensure no duplicate file names are created
## 16 categories containing 16 items
## change the integer added to keep value in certain range while still being polymorphic
pseudoRAND1=$(( $pseudoRAND1 + 5 )) ## ensures value isn't 0
pseudoRAND2=$(( $pseudoRAND2 + 12 ))
pseudoRAND3=$(( $pseudoRAND3 + 15 ))
pseudoRAND4=$(( $pseudoRAND4 + 31 ))
pseudoRAND5=$(( $pseudoRAND5 + 39 ))
pseudoRAND6=$(( $pseudoRAND6 + 56 ))
pseudoRAND7=$(( $pseudoRAND7 + 74 ))
pseudoRAND8=$(( $pseudoRAND8 + 93 ))
pseudoRAND9=$(( $pseudoRAND9 + 108 ))
pseudoRAND10=$(( $pseudoRAND10 + 125 ))
pseudoRAND11=$(( $pseudoRAND11 + 127 ))
pseudoRAND12=$(( $pseudoRAND12 + 146 ))
pseudoRAND13=$(( $pseudoRAND13 + 185 ))
pseudoRAND14=$(( $pseudoRAND14 + 203 ))
pseudoRAND15=$(( $pseudoRAND15 + 214 ))
pseudoRAND16=$(( $pseudoRAND16 + 230 ))

## select name of file to be created by user
createdFile=$(head -n $pseudoRAND5 masterArray.txt | tail -1)
secondCreatedFile=$(head -n $pseudoRAND2 masterArray.txt | tail -1)

## set files based on pseudorands
file1=$(head -n $pseudoRAND1 masterArray.txt | tail -1)
file2=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
file3=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
file4=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
file5=$(head -n $pseudoRAND5 masterArray.txt | tail -1)
file6=$(head -n $pseudoRAND6 masterArray.txt | tail -1)
file7=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
file8=$(head -n $pseudoRAND8 masterArray.txt | tail -1)
file9=$(head -n $pseudoRAND9 masterArray.txt | tail -1)
file10=$(head -n $pseudoRAND10 masterArray.txt | tail -1)
file11=$(head -n $pseudoRAND11 masterArray.txt | tail -1)
file12=$(head -n $pseudoRAND12 masterArray.txt | tail -1)
file13=$(head -n $pseudoRAND13 masterArray.txt | tail -1)
file14=$(head -n $pseudoRAND14 masterArray.txt | tail -1)
file15=$(head -n $pseudoRAND15 masterArray.txt | tail -1)
file16=$(head -n $pseudoRAND16 masterArray.txt | tail -1)

## create level-related files
mkdir level13/
touch level13/"$file1"
touch level13/"$file2"
touch level13/"$file3"
touch level13/"$file4"
touch level13/"$file5"
touch level13/"$file6"
touch level13/"$file7"
touch level13/"$file8"


echo "$file9" >> level13/"$file1"
echo "$file10" >> level13/"$file1"
echo "$file11" >> level13/"$file1"
echo "$file12" >> level13/"$file1"
echo "$file13" >> level13/"$file1"
echo "$file14" >> level13/"$file1"
echo "$file15" >> level13/"$file1"
echo "$file16" >> level13/"$file1"

echo "$file9" >> level13/"$file2"
echo "$file10" >> level13/"$file2"
echo "$file11" >> level13/"$file2"
echo "$file12" >> level13/"$file2"
echo "$file13" >> level13/"$file2"
echo "$file14" >> level13/"$file2"
echo "$file15" >> level13/"$file2"
echo "$file16" >> level13/"$file2"

echo "$file9" >> level13/"$file3"
echo "$file10" >> level13/"$file3"
echo "$file11" >> level13/"$file3"
echo "$file12" >> level13/"$file3"
echo "$file13" >> level13/"$file3"
echo "$file14" >> level13/"$file3"
echo "$file15" >> level13/"$file3"
echo "$file16" >> level13/"$file3"

echo "$file9" >> level13/"$file4"
echo "$file10" >> level13/"$file4"
echo "$file11" >> level13/"$file4"
echo "$file12" >> level13/"$file4"
echo "$file13" >> level13/"$file4"
echo "$file14" >> level13/"$file4"
echo "$file15" >> level13/"$file4"
echo "$file16" >> level13/"$file4"

echo "$file9" >> level13/"$file5"
echo "$file10" >> level13/"$file5"
echo "$file11" >> level13/"$file5"
echo "$file12" >> level13/"$file5"
echo "$file13" >> level13/"$file5"
echo "$file14" >> level13/"$file5"
echo "$file15" >> level13/"$file5"
echo "$file16" >> level13/"$file5"

echo "$file9" >> level13/"$file6"
echo "$file10" >> level13/"$file6"
echo "$file11" >> level13/"$file6"
echo "$file12" >> level13/"$file6"
echo "$file13" >> level13/"$file6"
echo "$file14" >> level13/"$file6"
echo "$file15" >> level13/"$file6"
echo "$file16" >> level13/"$file6"

echo "$file9" >> level13/"$file7"
echo "$file10" >> level13/"$file7"
echo "$file11" >> level13/"$file7"
echo "$file12" >> level13/"$file7"
echo "$file13" >> level13/"$file7"
echo "$file14" >> level13/"$file7"
echo "$file15" >> level13/"$file7"
echo "$file16" >> level13/"$file7"

echo "$file9" >> level13/"$file8"
echo "$file10" >> level13/"$file8"
echo "$file11" >> level13/"$file8"
echo "$file12" >> level13/"$file8"
echo "$file13" >> level13/"$file8"
echo "$file14" >> level13/"$file8"
echo "$file15" >> level13/"$file8"
echo "$file16" >> level13/"$file8"


## add directions

echo "* Level 13" >> level13/README
echo "Use the paste command to combine the $createdFile file with the $secondCreatedFile file." >> level13/README
echo "Add these to a new file in the level13 directory named answer.txt" >> level13/README
echo "Hint: Use redirection." >> level13/README
echo "Once finished, run the verify.sh script." >> level13/README

