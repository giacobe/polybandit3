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


## convert hash character from hex to decimal
pseudoRAND1=$(echo "ibase=16; $pseudoRANDcapture1" | bc)
pseudoRAND2=$(echo "ibase=16; $pseudoRANDcapture2" | bc)
pseudoRAND3=$(echo "ibase=16; $pseudoRANDcapture3" | bc)
pseudoRAND4=$(echo "ibase=16; $pseudoRANDcapture4" | bc)
pseudoRAND5=$(echo "ibase=16; $pseudoRANDcapture5" | bc)
pseudoRAND6=$(echo "ibase=16; $pseudoRANDcapture6" | bc)
pseudoRAND7=$(echo "ibase=16; $pseudoRANDcapture7" | bc)
pseudoRAND8=$(echo "ibase=16; $pseudoRANDcapture8" | bc)



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


## based on the first character of the hash, select which set of 16 items should be chosen from masterArray
case "$pseudoRAND3" in
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

case "$pseudoRAND7" in
    "1") dictSelect2=1   # airlines   
    ;;
    "2") dictSelect2=17  # appliances
    ;;
    "3") dictSelect2=33  # candy
    ;;
    "4") dictSelect2=49  # car brands
    ;;
    "5") dictSelect2=65  # cheese
    ;;
    "6") dictSelect2=81  # cities
    ;;
    "7") dictSelect2=97  # clothing brands
    ;;
    "8") dictSelect2=113 # colleges
    ;;
    "9") dictSelect2=129 # countries
    ;;
    "10") dictSelect2=145    # letters
    ;;
    "11") dictSelect2=161    # dog breeds
    ;;
    "12") dictSelect2=177    # fast food
    ;;
    "13") dictSelect2=193    # fruits
    ;;
    "14") dictSelect2=209    # instruments
    ;;
    "15") dictSelect2=225    # music artists
    ;;
    "16") dictSelect2=241    # sports
    ;;
esac


## endRange adds 16 to get 15 directories the same plus 1 different directory at the tail
endRange=$(( $dictSelect + 16 ))
sed -n "$dictSelect","$endRange"p masterArray.txt > dirList.txt
endRange2=$(( $dictSelect2 + 16 ))
sed -n "$dictSelect2","$endRange2"p masterArray.txt > dirList2.txt

## select name of file to be created by user
## fix this to be polymorphic
targetDirectory=$(head -n 4 dirList.txt | tail -1)
targetFile=$(head -n $pseudoRAND3 dirList2.txt | tail -1)
## set directories based on pseudorands
dir1=$(head -n 1 dirList.txt | tail -1)
dir2=$(head -n 2 dirList.txt | tail -1)
dir3=$(head -n 3 dirList.txt | tail -1)
dir4=$(head -n 4 dirList.txt | tail -1)
dir5=$(head -n 5 dirList.txt | tail -1)
dir6=$(head -n 6 dirList.txt | tail -1)
dir7=$(head -n 7 dirList.txt | tail -1)
dir8=$(head -n 8 dirList.txt | tail -1)

file1=$(head -n 1 dirList2.txt | tail -1)
file2=$(head -n 2 dirList2.txt | tail -1)
file3=$(head -n 3 dirList2.txt | tail -1)
file4=$(head -n 4 dirList2.txt | tail -1)
file5=$(head -n 5 dirList2.txt | tail -1)
file6=$(head -n 6 dirList2.txt | tail -1)
file7=$(head -n 7 dirList2.txt | tail -1)
file8=$(head -n 17 dirList2.txt | tail -1)

## create level-related directories

mkdir level10/
mkdir level10/"$dir1"
mkdir level10/"$dir2"
mkdir level10/"$dir3"
mkdir level10/"$dir4"
mkdir level10/"$dir5"
mkdir level10/"$dir6"
mkdir level10/"$dir7"
mkdir level10/"$dir8"

## add files to target dir
touch level10/"$targetDirectory"/"$file1"
touch level10/"$targetDirectory"/"$file2"
touch level10/"$targetDirectory"/"$file3"
touch level10/"$targetDirectory"/"$file4"
touch level10/"$targetDirectory"/"$file5"
touch level10/"$targetDirectory"/"$file6"
touch level10/"$targetDirectory"/"$file7"
touch level10/"$targetDirectory"/"$file8"



noiseData1=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
noiseData2=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
noiseData3=$(head -n $pseudoRAND7 masterArray.txt | tail -1)
noiseData4=$(head -n $pseudoRAND4 masterArray.txt | tail -1)
noiseData5=$(head -n $pseudoRAND3 masterArray.txt | tail -1)
noiseData6=$(head -n $pseudoRAND2 masterArray.txt | tail -1)
noiseData7=$(head -n $pseudoRAND8 masterArray.txt | tail -1)
noiseData8=$(head -n $pseudoRAND1 masterArray.txt | tail -1)


## generate noise data

touch level10/"$dir1"/"$noiseData1".csv
touch level10/"$dir1"/"$noiseData2".cab
touch level10/"$dir1"/"$noiseData3".notthisone
touch level10/"$dir1"/"$noiseData4".jar
touch level10/"$dir1"/"$noiseData5".iso
touch level10/"$dir1"/"$noiseData6".html
touch level10/"$dir1"/"$noiseData7".lnk
touch level10/"$dir1"/"$noiseData8".doc

## generate signal data
touch level10/"$targetDirectory"/"$targetFile".inhere


touch level10/"$dir2"/"$noiseData1".log
touch level10/"$dir2"/"$noiseData2".notthisone
touch level10/"$dir2"/"$noiseData3".huh
touch level10/"$dir2"/"$noiseData4".dat
touch level10/"$dir2"/"$noiseData5".txt
touch level10/"$dir2"/"$noiseData6".rar
touch level10/"$dir2"/"$noiseData7".txt
touch level10/"$dir2"/"$noiseData8".txt

touch level10/"$dir3"/"$noiseData1".txt
touch level10/"$dir3"/"$noiseData2".csv
touch level10/"$dir3"/"$noiseData3".txt
touch level10/"$dir3"/"$noiseData4".txt
touch level10/"$dir3"/"$noiseData5".csv
touch level10/"$dir3"/"$noiseData6".notthisone
touch level10/"$dir3"/"$noiseData7".txt
touch level10/"$dir3"/"$noiseData8".txt

touch level10/"$dir4"/"$noiseData1".jpeg
touch level10/"$dir4"/"$noiseData2".iso
touch level10/"$dir4"/"$noiseData3".rar
touch level10/"$dir4"/"$noiseData4".notthisone
touch level10/"$dir4"/"$noiseData5".rar
touch level10/"$dir4"/"$noiseData6".rar
touch level10/"$dir4"/"$noiseData7".dat
touch level10/"$dir4"/"$noiseData8".dat

touch level10/"$dir5"/"$noiseData1".csv
touch level10/"$dir5"/"$noiseData2".txt
touch level10/"$dir5"/"$noiseData3".txt
touch level10/"$dir5"/"$noiseData4".txt
touch level10/"$dir5"/"$noiseData5".nothere
touch level10/"$dir5"/"$noiseData6".txt
touch level10/"$dir5"/"$noiseData7".csv
touch level10/"$dir5"/"$noiseData8".csv

touch level10/"$dir6"/"$noiseData1".mov
touch level10/"$dir6"/"$noiseData2".txt
touch level10/"$dir6"/"$noiseData3".txt
touch level10/"$dir6"/"$noiseData4".wrongdir
touch level10/"$dir6"/"$noiseData5".mov
touch level10/"$dir6"/"$noiseData6".dat
touch level10/"$dir6"/"$noiseData7".dat
touch level10/"$dir6"/"$noiseData8".mov

touch level10/"$dir7"/"$noiseData1".css
touch level10/"$dir7"/"$noiseData2".css
touch level10/"$dir7"/"$noiseData3".html
touch level10/"$dir7"/"$noiseData4".html
touch level10/"$dir7"/"$noiseData5".nothereeither
touch level10/"$dir7"/"$noiseData6".html
touch level10/"$dir7"/"$noiseData7".html
touch level10/"$dir7"/"$noiseData8".html

touch level10/"$dir8"/"$noiseData1".txt
touch level10/"$dir8"/"$noiseData2".txt
touch level10/"$dir8"/"$noiseData3".txt
touch level10/"$dir8"/"$noiseData4".txt
touch level10/"$dir8"/"$noiseData5".dmg
touch level10/"$dir8"/"$noiseData6".dmg
touch level10/"$dir8"/"$noiseData7".dmg
touch level10/"$dir8"/"$noiseData8".dmg

## generate noise INSIDE files
echo "$file1" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file2" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file3" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file4" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file5" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file6" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file7" >> level10/"$targetDirectory"/"$targetFile".inhere
echo "$file8" >> level10/"$targetDirectory"/"$targetFile".inhere


## instructions

echo "* Level 10" >> level10/README
echo "Find the file unlike the others inside the $targetDirectory directory." >> level10/README
echo "Remove the line in this file that is different than the others." >> level10/README
echo "Once finished, run the verify.sh script." >> level10/README
rm dirList.txt dirList2.txt
