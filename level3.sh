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
declare -a dict17

readarray -t dict1 <dictionaries/airlines.txt
readarray -t dict11 <dictionaries/appliances.txt
readarray -t dict7 <dictionaries/beerBrands.txt
readarray -t dict16 <dictionaries/candy.txt
readarray -t dict15 <dictionaries/carBrands.txt
readarray -t dict10 <dictionaries/cheese.txt
readarray -t dict9 <dictionaries/cities.txt
readarray -t dict14 <dictionaries/clothingBrands.txt
readarray -t dict4 <dictionaries/instruments.txt
readarray -t dict13 <dictionaries/countries.txt
readarray -t dict2 <dictionaries/dogBreeds.txt
readarray -t dict6 <dictionaries/fruits.txt
readarray -t dict8 <dictionaries/operatingSystems.txt
readarray -t dict12 <dictionaries/seasonings.txt
readarray -t dict3 <dictionaries/sports.txt
readarray -t dict5 <dictionaries/fastFood.txt
readarray -t dict17 <dictionaries/createdDirectoryDictionary.txt

# https://stackoverflow.com/questions/22466704/assign-each-line-of-file-to-be-a-variable
# Thereafter, you can refer to the lines by number. The first line is "${lines[0]}" and the second is "${lines[1]}", etc.

pseudoRANDcapture=$(cut -c 2 userHash.txt)
secondCapture=$(cut -c 6 userHash.txt)
thirdCapture=$(cut -c 8 userHash.txt)
fourthCapture=$(cut -c 12 userHash.txt)
pseudoRAND=$(echo "ibase=16; $pseudoRANDcapture" | bc)
secondRAND=$(echo "ibase=16; $secondCapture" | bc)
thirdRAND=$(echo "ibase=16; $thirdCapture" | bc)
fourthRAND=$(echo "ibase=16; $fourthCapture" | bc)

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
loc17=$(cut -c 17 userHash.txt)

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

createdFileSeed=$(echo "ibase=16; $loc17" | bc)

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

targetDirectorySeed=$pseudoRAND
secondTargetDirectorySeed=$secondRAND
thirdTargetDirectorySeed=$thirdRAND
fourthTargetDirectorySeed=$fourthRAND
targetDirectory=$(echo -n "${directoryDict[$targetDirectorySeed]}")
secondTargetDirectory=$(echo -n "${directoryDict[$secondTargetDirectorySeed]}")
thirdTargetDirectory=$(echo -n "${directoryDict[$thirdTargetDirectorySeed]}")
fourthTargetDirectory=$(echo -n "${directoryDict[$fourthTargetDirectorySeed]}")
## create static directories
mkdir "level3"
mkdir level3/$dir1
mkdir level3/$dir2
mkdir level3/$dir3
mkdir level3/$dir4
mkdir level3/$dir5
mkdir level3/$dir6
mkdir level3/$dir7
mkdir level3/$dir8
mkdir level3/$dir9
## data filled
mkdir level3/$dir10
mkdir level3/$dir11
mkdir level3/$dir12
mkdir level3/$dir13
mkdir level3/$dir14
mkdir level3/$dir15
mkdir level3/$dir16

cp level3Verify.sh level3/

## generate noise files
firstDataFile=$(echo -n "${directoryDict[2]}.jpg")
secondDataFile=$(echo -n "${directoryDict[5]}.txt")
thirdDataFile=$(echo -n "${directoryDict[8]}.csv")
fourthDataFile=$(echo -n "${directoryDict[13]}.txt")
fifthDataFile=$(echo -n "${directoryDict[12]}.pcap")
sixthDataFile=$(echo -n "${directoryDict[1]}.log")
touch level3/$secondTargetDirectory/$firstDataFile
touch level3/$secondTargetDirectory/$secondDataFile
touch level3/$secondTargetDirectory/$thirdDataFile
touch level3/$secondTargetDirectory/$fourthDataFile
touch level3/$secondTargetDirectory/$fifthDataFile
touch level3/$secondTargetDirectory/$sixthDataFile
createdFile=$(echo -n "${dict17[$createdFileSeed]}")
touch level3/$targetDirectory/$createdFile.txt
echo "move me" > level3/$targetDirectory/$createdFile.txt
echo "*"
echo "*"
echo "*"
echo "Please change to the 'level3' directory and copy the file named $createdFile.txt in the $targetDirectory directory into the $secondTargetDirectory directory." >> level3/README
echo "Next...copy all the txt files from $secondTargetDirectory into $thirdTargetDirectory" >> level3/README
echo "Finally, change the name of the $thirdTargetDirectory directory to '$fourthTargetDirectory'." >> level3/README
echo "Once finished, run the verify.sh script." >> level3/README
#cat level3/README
rm directoryList.txt
