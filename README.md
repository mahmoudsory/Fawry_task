# Fawry Task

## Q1: Custom Command (mygrep.sh)

### Reflective Section

#### How the Script Handles Arguments and Options

1. **Help Option**: The script first checks if the user requested help (`--help`) and displays the usage instructions.
2. **Argument Validation**: It verifies that enough arguments are passed. If not, an error message is printed, and the script exits.
3. **Option Handling**: If the first argument starts with a dash (`-`), it treats it as an option (e.g., `-n`, `-v`). The second argument is the search string, and the third is the filename.
4. **String and Filename Validation**: The script ensures both the search string and the filename are provided and valid.
5. **Default Behavior**: If no options are given, the script assumes the first argument is the search string and the second is the filename.
6. **File Existence Check**: It checks if the specified file exists. If not, an error message is displayed, and the script exits.
7. **Building the Command**: Based on the options, it constructs the appropriate `grep` command:
   - `-i` for case-insensitive search
   - `-n` for showing line numbers
   - `-v` for inverting the match
8. **Execution**: Finally, it runs the `grep` command with the collected options.

#### Supporting Regex or -i/-c/-l Options

To support regex or options like `-i`, `-c`, or `-l`, I would modify the script to loop through all arguments and process each option individually. Instead of assuming a fixed order, the script would dynamically detect and apply multiple options. This approach would enhance flexibility and allow easy extension for features like counting matches or listing filenames, making the script behave more like the actual `grep` tool.

#### What Was the Hardest Part and Why?

The most challenging aspect was properly handling invalid input. This is tricky because users might:

- Forget to provide the search string
- Mix up options and filenames
- Supply too few arguments or a non-existent file

The challenge was to maintain simplicity while accurately catching and reporting these different errors without cluttering the code. Effective error checking significantly improved the script's reliability and user-friendliness.
