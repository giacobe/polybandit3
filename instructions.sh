#!/bin/sh

# Function to format a string with leading and trailing * to create a blockquote style output
format_with_asterisks() {
    local input="$1"
    local width=70
    local lines=""


    break_char="*"
    count=$((width + 2))
    break_line=""
    while [ "$count" -gt 0 ]; do
        break_line="${break_line}${break_char}"
        count=$((count - 1))
    done

    lines="$lines$break_line\n"

    # Split the input into lines while preserving word boundaries
    while [ -n "$input" ]; do
        if [ ${#input} -le $width ]; then
            #this is the last line
            lines="$lines* ${input}$(printf '%*s' $(($width -1 - ${#input})) | tr ' ' ' ')*\n"
            lines="$lines$break_line\n"
            break
        else
            #this is for all lines except the last one
            line="${input:0:$width-1}"
            # Find the last space within the width
            last_space=$(expr "$line" : '.* ')

            # If no space was found, just cut at the width
            if [ -z "$last_space" ]; then
                last_space=$width
            fi

            line="${line:0:$last_space}"
            input="${input:$last_space}"
            lines="$lines* ${line}$(printf '%*s' $(($width -1 - ${#line})) | tr ' ' ' ')*\n"

        fi
    done

    echo -e "$lines"
}

# Example usage:
original_string="This is a very long string that will be formatted with a trailing asterisk at position 70. This is a test of multiple lines. I mean that this is a really long line. This line should take multiple lines to output in the final result. This should result in a lot of text and a lot of lines. Now is the time for all good men to come to the aid of their country."
formatted_string=$(format_with_asterisks "$original_string")

echo "Original String:"
echo "$original_string"
echo "Formatted String:"
echo -e "$formatted_string"