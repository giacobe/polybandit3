#!/bin/bash

declare -a dict1
declare -a dict2
declare -a dict3
declare -a dict4
declare -a dict5
declare -a dict6
declare -a dict7
declare -a dict8
declare -a dict9
declare -a dict10
declare -a dict11
declare -a dict12
declare -a dict13
declare -a dict14
declare -a dict15
declare -a dict16

readarray -t dict2 <dictionaries/airlines.txt
readarray -t dict3 <dictionaries/appliances.txt
readarray -t dict4 <dictionaries/colleges.txt
readarray -t dict5 <dictionaries/candy.txt
readarray -t dict6 <dictionaries/carBrands.txt
readarray -t dict7 <dictionaries/cheese.txt
readarray -t dict8 <dictionaries/cities.txt
readarray -t dict9 <dictionaries/clothingBrands.txt
readarray -t dict10 <dictionaries/instruments.txt
readarray -t dict11 <dictionaries/countries.txt
readarray -t dict12 <dictionaries/dogBreeds.txt
readarray -t dict13 <dictionaries/fruits.txt
readarray -t dict14 <dictionaries/operatingSystems.txt
readarray -t dict15 <dictionaries/seasonings.txt
readarray -t dict16 <dictionaries/sports.txt
readarray -t dict1 <dictionaries/fastFood.txt

# https://stackoverflow.com/questions/22466704/assign-each-line-of-file-to-be-a-variable
# Thereafter, you can refer to the lines by number. The first line is "${lines[0]}" and the second is "${lines[1]}", etc.

## read in user ID and generate hash with combined password

secondCapture=$(cut -c 3 userHash.txt)
thirdCapture=$(cut -c 8 userHash.txt)
secondRAND=$(echo "ibase=16; $secondCapture" | bc)
thirdRAND=$(echo "ibase=16; $thirdCapture" | bc)

loc1=$(cut -c 1 userHash.txt)
loc2=$(cut -c 2 userHash.txt)
loc3=$(cut -c 3 userHash.txt)
loc4=$(cut -c 4 userHash.txt)
loc5=$(cut -c 5 userHash.txt)
loc6=$(cut -c 6 userHash.txt)
loc7=$(cut -c 7 userHash.txt)
loc8=$(cut -c 8 userHash.txt)
loc9=$(cut -c 9 userHash.txt)
loc10=$(cut -c 10 userHash.txt)
loc11=$(cut -c 11 userHash.txt)
loc12=$(cut -c 12 userHash.txt)
loc13=$(cut -c 13 userHash.txt)
loc14=$(cut -c 14 userHash.txt)
loc15=$(cut -c 15 userHash.txt)
loc16=$(cut -c 16 userHash.txt)

dir1Seed=$(echo "ibase=16; $loc1" | bc) 
dir2Seed=$(echo "ibase=16; $loc2" | bc)
dir3Seed=$(echo "ibase=16; $loc3" | bc)
dir4Seed=$(echo "ibase=16; $loc4" | bc)
dir5Seed=$(echo "ibase=16; $loc5" | bc)
dir6Seed=$(echo "ibase=16; $loc6" | bc) 
dir7Seed=$(echo "ibase=16; $loc7" | bc)
dir8Seed=$(echo "ibase=16; $loc8" | bc)
dir9Seed=$(echo "ibase=16; $loc9" | bc)
dir10Seed=$(echo "ibase=16; $loc10" | bc)
dir11Seed=$(echo "ibase=16; $loc11" | bc) 
dir12Seed=$(echo "ibase=16; $loc12" | bc)
dir13Seed=$(echo "ibase=16; $loc13" | bc)
dir14Seed=$(echo "ibase=16; $loc14" | bc)
dir15Seed=$(echo "ibase=16; $loc15" | bc)
dir16Seed=$(echo "ibase=16; $loc16" | bc)


dir1=$(echo -n "${dict1[$dir1Seed]}")
dir2=$(echo -n "${dict2[$dir2Seed]}")
dir3=$(echo -n "${dict3[$dir3Seed]}")
dir4=$(echo -n "${dict4[$dir4Seed]}")
dir5=$(echo -n "${dict5[$dir5Seed]}")
dir6=$(echo -n "${dict6[$dir6Seed]}")
dir7=$(echo -n "${dict7[$dir7Seed]}")
dir8=$(echo -n "${dict8[$dir8Seed]}")
dir9=$(echo -n "${dict9[$dir9Seed]}")
dir10=$(echo -n "${dict10[$dir10Seed]}")
dir11=$(echo -n "${dict11[$dir11Seed]}")
dir12=$(echo -n "${dict12[$dir12Seed]}")
dir13=$(echo -n "${dict13[$dir13Seed]}")
dir14=$(echo -n "${dict14[$dir14Seed]}")
dir15=$(echo -n "${dict15[$dir15Seed]}")
dir16=$(echo -n "${dict16[$dir16Seed]}")

echo "$dir1" >> directoryList.txt
echo "$dir2" >> directoryList.txt
echo "$dir3" >> directoryList.txt
echo "$dir4" >> directoryList.txt
echo "$dir5" >> directoryList.txt
echo "$dir6" >> directoryList.txt
echo "$dir7" >> directoryList.txt
echo "$dir8" >> directoryList.txt
echo "$dir9" >> directoryList.txt
echo "$dir10" >> directoryList.txt
echo "$dir11" >> directoryList.txt
echo "$dir12" >> directoryList.txt
echo "$dir13" >> directoryList.txt
echo "$dir14" >> directoryList.txt
echo "$dir15" >> directoryList.txt
echo "$dir16" >> directoryList.txt

declare -a directoryDict
readarray -t directoryDict <directoryList.txt

secondTargetDirectorySeed=$secondRAND
thirdTargetDirectorySeed=$thirdRAND
secondTargetDirectory=$(echo -n "${directoryDict[$secondTargetDirectorySeed]}")
thirdTargetDirectory=$(echo -n "${directoryDict[$thirdTargetDirectorySeed]}")
## create static directories
mkdir "level9"
mkdir level9/"$dir1"
mkdir level9/"$dir2"
mkdir level9/"$dir3"
mkdir level9/"$dir4"
mkdir level9/"$dir5"
mkdir level9/"$dir6"
mkdir level9/"$dir7"
mkdir level9/"$dir8"
mkdir level9/"$dir9"
mkdir level9/"$dir10"
mkdir level9/"$dir11"
mkdir level9/"$dir12"
mkdir level9/"$dir13"
mkdir level9/"$dir14"
mkdir level9/"$dir15"
mkdir level9/"$dir16"


## pseudorandom
secondRANDCapture=$(cut -c 3 userHash.txt)
pseudoRAND=$(echo "ibase=16; $secondRANDCapture" | bc)
noiseDirectory1=$(echo -n "${directoryDict[6]}")
noiseDirectory2=$(echo -n "${directoryDict[1]}")
noiseDirectory3=$(echo -n "${directoryDict[8]}")
noiseDirectory4=$(echo -n "${directoryDict[12]}")

randDictSeed=$(echo -n "dict$pseudoRAND") ## returns dict2 for example
#randDictSeed2=$(echo -n "dict$secondRAND") ## returns dict3 for example
#echo "$randDictSeed"
#echo "$randDictSeed2"

declare -a randDictSelection
declare -a dictNumber1
#declare -a diffDict
readarray -t randDictSelection < dictionaries/allDirectoryNames.txt
number1=${randDictSelection[$randDictSeed]}
#number2=${randDictSelection[$randDictSeed2]}
readarray -t dictNumber1 < dictionaries/"$number1"
#readarray -t diffDict < dictionaries/"$number2"

## pick 2 dictionaries, pick 5 strings from first dictionary, pick 1 from second dictionary
## noise files
mkdir level9/"$secondTargetDirectory"/"${dictNumber1[1]}"
mkdir level9/"$secondTargetDirectory"/"${dictNumber1[2]}"
mkdir level9/"$secondTargetDirectory"/"${dictNumber1[6]}"
mkdir level9/"$secondTargetDirectory"/"${dictNumber1[9]}"
mkdir level9/"$secondTargetDirectory"/"${dictNumber1[13]}"
mkdir level9/"$secondTargetDirectory"/"${dict3[4]}"

mkdir level9/"$noiseDirectory1"/"${dictNumber1[1]}"
mkdir level9/"$noiseDirectory1"/"${dictNumber1[3]}"
mkdir level9/"$noiseDirectory1"/"${dictNumber1[6]}"
mkdir level9/"$noiseDirectory1"/"${dictNumber1[9]}"
mkdir level9/"$noiseDirectory1"/"${dictNumber1[13]}"
mkdir level9/"$noiseDirectory1"/"${dict3[4]}"
#############
mkdir level9/"$noiseDirectory2"/"${dictNumber1[1]}"
mkdir level9/"$noiseDirectory2"/"${dictNumber1[3]}"
mkdir level9/"$noiseDirectory2"/"${dictNumber1[6]}"
mkdir level9/"$noiseDirectory2"/"${dictNumber1[9]}"
mkdir level9/"$noiseDirectory2"/"${dictNumber1[13]}"
mkdir level9/"$noiseDirectory2"/"${dict3[4]}"

mkdir level9/"$noiseDirectory3"/"${dictNumber1[1]}"
mkdir level9/"$noiseDirectory3"/"${dictNumber1[3]}"
mkdir level9/"$noiseDirectory3"/"${dictNumber1[6]}"
mkdir level9/"$noiseDirectory3"/"${dictNumber1[9]}"
mkdir level9/"$noiseDirectory3"/"${dictNumber1[13]}"
mkdir level9/"$noiseDirectory3"/"${dict3[4]}"

mkdir level9/"$noiseDirectory4"/"${dictNumber1[1]}"
mkdir level9/"$noiseDirectory4"/"${dictNumber1[3]}"
mkdir level9/"$noiseDirectory4"/"${dictNumber1[6]}"
mkdir level9/"$noiseDirectory4"/"${dictNumber1[9]}"
mkdir level9/"$noiseDirectory4"/"${dictNumber1[13]}"
mkdir level9/"$noiseDirectory4"/"${dict3[4]}"



cp level9Verify.sh level9/

firstDataFile=$(echo -n "${directoryDict[2]}.jpg")
secondDataFile=$(echo -n "${directoryDict[5]}.csv")
thirdDataFile=$(echo -n "${directoryDict[8]}.csv")
fourthDataFile=$(echo -n "${directoryDict[13]}.txt")
fifthDataFile=$(echo -n "${directoryDict[12]}.pcap")
sixthDataFile=$(echo -n "${directoryDict[1]}.csv")
touch level9/"$secondTargetDirectory"/"$firstDataFile"
touch level9/"$secondTargetDirectory"/"$secondDataFile"
touch level9/"$secondTargetDirectory"/"$thirdDataFile"
touch level9/"$secondTargetDirectory"/"$fourthDataFile"
touch level9/"$secondTargetDirectory"/"$fifthDataFile"
touch level9/"$secondTargetDirectory"/"$sixthDataFile"

touch level9/"$noiseDirectory1"/"$firstDataFile"
touch level9/"$noiseDirectory1"/"$secondDataFile"
touch level9/"$noiseDirectory1"/"$thirdDataFile"
touch level9/"$noiseDirectory1"/"$fourthDataFile"
touch level9/"$noiseDirectory1"/"$fifthDataFile"
touch level9/"$noiseDirectory1"/"$sixthDataFile"

touch level9/"$noiseDirectory2"/"$firstDataFile"
touch level9/"$noiseDirectory2"/"$secondDataFile"
touch level9/"$noiseDirectory2"/"$thirdDataFile"
touch level9/"$noiseDirectory2"/"$fourthDataFile"
touch level9/"$noiseDirectory2"/"$fifthDataFile"
touch level9/"$noiseDirectory2"/"$sixthDataFile"

touch level9/"$noiseDirectory3"/"$firstDataFile"
touch level9/"$noiseDirectory3"/"$secondDataFile"
touch level9/"$noiseDirectory3"/"$thirdDataFile"
touch level9/"$noiseDirectory3"/"$fourthDataFile"
touch level9/"$noiseDirectory3"/"$fifthDataFile"
touch level9/"$noiseDirectory3"/"$sixthDataFile"

touch level9/"$noiseDirectory4"/"$firstDataFile"
touch level9/"$noiseDirectory4"/"$secondDataFile"
touch level9/"$noiseDirectory4"/"$thirdDataFile"
touch level9/"$noiseDirectory4"/"$fourthDataFile"
touch level9/"$noiseDirectory4"/"$fifthDataFile"
touch level9/"$noiseDirectory4"/"$sixthDataFile"


echo "* Level 9" >> level9/README
echo " Remove all the .csv files inside the $secondTargetDirectory directory" >> level9/README
echo " Remove the $thirdTargetDirectory directory" >> level9/README
echo " Once finished, run the verify.sh script." >> level9/README
rm directoryList.txt
