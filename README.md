# Fawry Task

# Q1-Reflective Section

### How the Script Handles Arguments and Options

1. **Help Option**: The script begins by checking if the user has requested help (`--help`). If so, it displays the usage instructions and exits.

2. **Argument Validation**: It verifies that sufficient arguments are provided. If not, an error message is printed, and the script exits.

3. **Option Handling**: If the first argument begins with a dash (`-`), it is treated as an option (e.g., `-n`, `-v`). The second argument is designated as the search string, and the third as the filename.

4. **String and Filename Validation**: The script ensures that both the search string and the filename are provided. If either is missing, it prints an error message and exits.

5. **Default Behavior**: If no options are specified, the script assumes the first argument is the search string and the second is the filename.

6. **File Existence Check**: It checks if the specified file exists. If the file is not found, an error message is displayed, and the script exits.

7. **Building the Command**: Based on the provided options, the script constructs the appropriate search logic. It uses case-insensitive comparison and handles line numbering and inverted matching as specified by the flags.

8. **Execution**: Finally, the script processes the file line by line, applying the constructed logic to match and display the appropriate lines.

### Supporting Regex or -i/-c/-l Options

To support regex or additional options like `-i`, `-c`, or `-l`, I would modify the script to loop through all arguments, processing each option individually. This would allow for dynamic detection and application of multiple options, rather than assuming a fixed order. Such an approach would enhance flexibility and enable features like counting matches or listing filenames, making the script behave more like the actual `grep` tool.

### What Was the Hardest Part and Why?

The most challenging aspect was effectively handling invalid input. This includes scenarios where users might:

- Forget to provide the search string
- Mix up options and filenames
- Supply too few arguments or reference a non-existent file

The challenge lay in maintaining simplicity while accurately capturing and reporting these various errors. Ensuring robust error checking significantly improved the script's reliability and user-friendliness, requiring careful consideration in the design of the validation logic.
