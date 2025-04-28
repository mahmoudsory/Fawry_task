#!/bin/bash

# If the user asks for help, display usage instructions and exit
if [[ "$1" == "--help" ]]; then
    echo "Usage: $0 [-n] [-v] search_string filename"
    exit 0
fi

# Check if enough arguments are provided
if [[ $# -lt 2 ]]; then
    echo "Error: Not enough arguments."
    echo "Usage: $0 [-n] [-v] search_string filename"
    exit 1
fi

# Initialize variables
options=""
search=""
file=""

# Check if the first argument is an option like -n or -v
if [[ "$1" == -* ]]; then
    options="$1"
    search="$2"
    file="$3"

    # Make sure both the search string and the filename are provided
    if [[ -z "$search" || "$search" == -* || -z "$file" ]]; then
        echo "Error: Missing search string or filename."
        echo "Usage: $0 [-n] [-v] search_string filename"
        exit 1
    fi
else
    # No options provided, just the search string and filename
    search="$1"
    file="$2"

    # Check if the filename is missing
    if [[ -z "$file" ]]; then
        echo "Error: Missing filename."
        exit 1
    fi
fi

# Check if the file actually exists
if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' not found."
    exit 1
fi

# Convert search string to lowercase for case-insensitive search
search=$(echo "$search" | tr '[:upper:]' '[:lower:]')

# Initialize line counter
line_number=0
found_match=false

# Read the file line by line
while IFS= read -r line; do
    # Increment line number
    line_number=$((line_number + 1))

    # Convert line to lowercase for case-insensitive comparison
    lower_line=$(echo "$line" | tr '[:upper:]' '[:lower:]')

    # Check if the line matches the search string
    if [[ "$lower_line" == *"$search"* ]]; then
        match=true
    else
        match=false
    fi

    # Invert match if -v is used
    if [[ "$options" == *v* ]]; then
        if [[ $match == true ]]; then
            match=false
        else
            match=true
        fi
    fi

    # Print the line if it matches the criteria
    if [[ $match == true ]]; then
        found_match=true
        if [[ "$options" == *n* ]]; then
            echo "$line_number: $line"
        else
            echo "$line"
        fi
    fi
done < "$file"

# If no match was found, exit with status 1
if [[ $found_match == false ]]; then
    exit 1
fi