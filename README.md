# Fawry_task
Q1 : Custom Command ( mygrep.sh )
Reflective Section
1. How the Script Handles Arguments and Options
First, it checks if the user asked for help (--help) and shows the usage instructions.

Then, it checks if enough arguments are passed. If not, it prints an error and exits.

If the first argument starts with a dash (-), it treats it as an option like -n or -v.

The second argument becomes the search string, and the third becomes the filename.

It validates that both the search string and the filename are provided and correct.

If no options are given, the script assumes the first argument is the search string and the second is the filename.

It checks if the specified file exists. If not, it shows an error and exits.

Based on the options, it builds the appropriate grep command (-i for case-insensitive, -n for showing line numbers, -v for inverting the match).

Finally, it runs the grep command with the collected options.

2. How Would the Structure Change to Support Regex or Additional Options (-i, -c, -l)?
If I wanted to support regular expressions and additional flags like -c (count matches) or -l (list filenames), I would improve the argument parsing.

Instead of assuming one option at a time, I would loop over all the arguments using a while loop and shift, like this:

while [[ "$1" == -* ]]; do
    case "$1" in
        -n) grep_options="$grep_options -n" ;;
        -v) grep_options="$grep_options -v" ;;
        -i) grep_options="$grep_options -i" ;;
        -c) grep_options="$grep_options -c" ;;
        -l) grep_options="$grep_options -l" ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
done
This way, the script could handle any combination of options in any order, making it much more flexible and easier to extend in the future.

3. What Was the Hardest Part and Why?
The hardest part was properly handling invalid input.

It’s tricky because:

The user might forget the search string.

They might mix up options and filenames.

They might provide too few arguments, or a non-existent file.

The challenge was to keep the script simple while still correctly catching and reporting all these different errors — without making the code look messy or complicated.

Good error checking made the script much more reliable and user-friendly.

