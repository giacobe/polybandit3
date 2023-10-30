#!/bin/sh

# Function to create a binary file with non-printable ASCII characters
create_binary_non_printable_file() {
  # Check if the correct number of arguments is provided
  if [ $# -ne 2 ]; then
    echo "Usage: create_binary_non_printable_file <output_file> <file_size>"
    return 1
  fi

  local output_file="$1"
  local file_size="$2"

  # Generate non-printable ASCII characters in binary format
  generate_binary_non_printable_chars() {
    # Generate a random byte value between 1 and 32 and write it to the file
    for i in $(seq 1 "$1"); do
      dd if=/dev/urandom bs=1 count=1 status=none | tr '\x20-\x7F' '\x80-\xFF' > "$output_file"
    done
  }

  # Generate the binary non-printable ASCII characters and save them to the output file
  generate_binary_non_printable_chars "$file_size"

  echo "Binary file $output_file created with $file_size non-printable ASCII characters."
}

# Call the function with arguments
create_binary_non_printable_file "output.bin" 24
