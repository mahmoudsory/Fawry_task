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

# Build the grep command options based on user input
grep_options="-i"  # Always search case-insensitively

if [[ "$options" == *v* ]]; then
    grep_options="$grep_options -v"  # Invert the match if -v is used
fi

if [[ "$options" == *n* ]]; then
    grep_options="$grep_options -n"  # Show line numbers if -n is used
fi

# Finally, run the grep command with the built options
grep $grep_options -- "$search" "$file"
