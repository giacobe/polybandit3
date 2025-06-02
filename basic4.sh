#!/bin/sh

# --- Required external variables (must be set before running this script) ---
# level_HASH
# levelToBuild
# readMeLocation
# origInstallDir

cd /home || {
  echo "Failed to change to /home"
  exit 1
}

# Extract relevant characters from level_HASH
firstChar=$(echo "$level_HASH" | cut -c1)
secondChar=$(echo "$level_HASH" | cut -c2)
thirdChar=$(echo "$level_HASH" | cut -c3)
fourthChar=$(echo "$level_HASH" | cut -c4)

# Convert second hash char to decimal (index into dictionary)
selectedItem=0
i=0
for hexdigit in 0 1 2 3 4 5 6 7 8 9 a b c d e f; do
  if [ "$hexdigit" = "$secondChar" ]; then
    selectedItem=$i
    break
  fi
  i=$((i + 1))
done

# Select signal dictionary
signalDict="$origInstallDir/dictionaries/dict${firstChar}.txt"
[ -f "$signalDict" ] || {
  echo "Missing dictionary: $signalDict"
  exit 1
}

# Get selected word as secret file
i=0
secretWord=""
while IFS= read -r line; do
  if [ "$i" -eq "$selectedItem" ]; then
    secretWord=$line
    break
  fi
  i=$((i + 1))
done < "$signalDict"

secretfilename="${secretWord}.txt"

# Select dictionary for noise, different than firstChar
hex="0123456789abcdef"
noisefile="$thirdChar"

if [ "$thirdChar" = "$firstChar" ]; then
  index=$(echo "$hex" | awk -v char="$thirdChar" 'BEGIN { print index(char, char) }')
  index=$((index + 1))
  [ "$thirdChar" = "f" ] && index=1
  noisefile=$(echo "$hex" | cut -c"$index")
fi

noiseDict="$origInstallDir/dictionaries/dict${noisefile}.txt"
[ -f "$noiseDict" ] || {
  echo "Missing dictionary: $noiseDict"
  exit 1
}

# Read noise words and append secretfilename
filelist=""
while IFS= read -r line; do
  filelist="$filelist ${line}.txt"
done < "$noiseDict"

filelist="$filelist $secretfilename"

# Sort filenames alphabetically
sorted_files=$(printf "%s\n" $filelist | sort)

# Find the position of the secret file
i=0
secretfilelocation=0
for filename in $sorted_files; do
  if [ "$filename" = "$secretfilename" ]; then
    secretfilelocation=$i
    break
  fi
  i=$((i + 1))
done

# Create output directory
mkdir -p "$levelToBuild" || {
  echo "Failed to create: $levelToBuild"
  exit 1
}

# Write all files in alphabetical order
i=0
for filename in $sorted_files; do
  if [ "$i" -eq "$secretfilelocation" ]; then
    # Secret file
    printf "%s\n" "$level_HASH" | base64 | tr -d '\r\n' | cut -c1-8 > "$levelToBuild/$filename"
  else
    hash=$(printf "%s" "$filename" | md5sum | awk '{print $1}')
    printf "%s\n" "$hash" | base64 | tr -d '\r\n' | cut -c1-8 > "$levelToBuild/$filename"
  fi
  i=$((i + 1))
done

# Write README hint
mkdir -p "$(dirname "$readMeLocation")"
{
  echo "* Display contents of the .txt file in*"
  echo "* the directory that is different than*"
  echo "* the others. The contents will be    *"
  echo "* the password for this level.        *"
  echo "***************************************"
} >> "$readMeLocation"
