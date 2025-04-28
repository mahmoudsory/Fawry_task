Fawry Task
Q1: Custom Command (mygrep.sh)
Reflective Section
How the Script Handles Arguments and Options
First, it checks if the user asked for help (--help) and shows the usage instructions.
Then, it checks if enough arguments are passed. If not, it prints an error and exits.
If the first argument starts with a dash (-), it treats it as an option like -n or -v.
The second argument becomes the search string, and the third becomes the filename.
It validates that both the search string and the filename are provided and correct.
If no options are given, the script assumes the first argument is the search string and the second is the filename.
It checks if the specified file exists. If not, it shows an error and exits.
Based on the options, it builds the appropriate grep command:
-i for case-insensitive search,
-n for showing line numbers,
-v for inverting the match.
Finally, it runs the grep command with the collected options.
Supporting Regex or -i/-c/-l Options
If I were to support regex or -i/-c/-l options, I would modify the script to loop through all arguments and process each option individually.
Instead of assuming a fixed order, the script would detect and apply multiple options dynamically.
This approach would make the script flexible and easier to extend for more features like regular expressions, counting matches, or listing filenames.
It would also make the script behave more like the real grep tool.
What Was the Hardest Part and Why?
The hardest part was properly handling invalid input.
It’s tricky because:
The user might forget the search string.
They might mix up options and filenames.
They might provide too few arguments, or a non-existent file.
The challenge was to keep the script simple while still correctly catching and reporting all these different errors — without making the code look messy or complicated.
Good error checking made the script much more reliable and user-friendly
