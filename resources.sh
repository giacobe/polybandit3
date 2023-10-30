#!/bin/sh

# Function to generate a file containing printable ASCII characters from the base64 character set
generate_base64_file() {
	# Check if the correct number of arguments is provided
	if [ $# -ne 2 ]; then
		echo "Usage: generate_base64_file <output_file> <file_size>"
		return 1
	fi

	local output_file="$1"
	local file_size="$2"

	# Define the base64 character set
	base64_chars="/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

	# Generate the base64 characters and save them to the output file
	generate_base64_chars() {
		local base64_length=${#base64_chars}

		while [ "$file_size" -gt 0 ]; do
		  local index=$((RANDOM % base64_length))
		  local char="${base64_chars:index:1}"
		  printf "%s" "$char"
		  file_size=$((file_size - 1))
		done
	}

	generate_base64_chars "$file_size" > "$output_file"

	#  echo "File $output_file created with $file_size base64 characters."
}

	#example Call the function with arguments
	#generate_base64_file "output.txt" 1000


create_binary_non_printable_file() {
	# Check if the correct number of arguments is provided
	if [ $# -ne 2 ]; then
	  echo "Usage: $0 <output_file> <file_size>"
	  exit 1
	fi

	output_file="$1"
	file_size="$2"

	# Generate non-printable ASCII characters using /dev/urandom and dd
	generate_non_printable_chars() {
	  # Use /dev/urandom to generate random bytes
	  dd if=/dev/urandom bs=1 count="$1" status=none | tr -d -c '\000-\037\177-\377'
	}

	# Generate the non-printable ASCII characters and save them to the output file
	generate_non_printable_chars "$file_size" > "$output_file"

	#echo "File $output_file created with $file_size non-printable ASCII characters."

	}


# Function to write binary values to a file
write_binary_values() {
    local output_file="$1"
    shift  # Remove the first argument (the output file)

    # Use printf to write the binary values to the file
    printf "%b" "$@" > "$output_file"
}

# Example usage:
# output_file="output.bin"
# Define binary values as arguments to the function
# write_binary_values "$output_file" "\x48" "\x65" "\x6C" "\x6C" "\x6F"

# Function to format input string into a block
format_block() {
    local input="$1"
    local width=70
    local block=""
    local divline="" 
    local divlinelen=$(($width + 3))
    count=width
    borderchar="*"
    while [ ${#divline} -lt $divlinelen ]; do
         divline="$divline$borderchar"
    done
    block="$divline\n"
    while [ -n "$input" ]; do
        if [ ${#input} -le $width ]; then
            # This is the last line
            while [ ${#input} -lt $width ]; do
                input="$input "
            done
            # If the remaining text fits within the width, add it as is
            block="$block$borderchar $input"
            block="$block$borderchar\n"
            break
        else
            # This is every other line other than the last one.

            local line="${input:0:$width}"

            # Find the last space within the width
            last_space=$(expr "$line" : '.* ')

            # If no space was found, just cut at the width
            if [ -z "$last_space" ]; then
                last_space=$width
            fi

            line="${line:0:$last_space}"
            input="${input:$last_space}"

            while [ ${#input} -lt $width ]; do
                input="$input "
            done

            # Append the line to the block with leading/trailing asterisks
            while [ ${#line} -lt $width ]; do
                line="$line "
            done
            block="$block$borderchar $line"
            block="$block$borderchar\n"
        fi
    done
    block="$block$divline\n"
    echo -e "$block"
}

# Example usage:
#original_string="This is a very long string that will be formatted into a block. It should preserve word boundaries and be 70 characters wide. This is a test of the formatting function."
#formatted_block=$(format_to_block "$original_string")
#
#echo "Original String:"
#echo "$original_string"
#echo "Formatted Block:"
#echo -e "$formatted_block"