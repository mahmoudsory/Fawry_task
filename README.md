# Fawry Task

## Q1 - Reflective Section

### How the Script Handles Arguments and Options

1. **Help Option**: The script checks if the user requests help (`--help`). If so, it displays usage instructions and exits.

2. **Argument Validation**: It verifies that sufficient arguments are provided. If not, an error message is printed, and the script exits.

3. **Option Handling**: If the first argument starts with a dash (`-`), it is treated as an option (e.g., `-n`, `-v`). The second argument is designated as the search string, and the third as the filename.

4. **String and Filename Validation**: The script ensures both the search string and the filename are provided. If either is missing, it prints an error message and exits.

5. **Default Behavior**: If no options are specified, the script assumes the first argument is the search string and the second is the filename.

6. **File Existence Check**: It checks if the specified file exists. If not, an error message is displayed, and the script exits.

7. **Building the Command**: Based on the provided options, the script constructs the appropriate search logic, using case-insensitive comparison and handling line numbering and inverted matching as specified by flags.

8. **Execution**: Finally, the script processes the file line by line, applying the constructed logic to match and display the appropriate lines.

### Supporting Regex or -i/-c/-l Options

To support regex or additional options like `-i`, `-c`, or `-l`, I would modify the script to loop through all arguments, processing each option individually. This would enhance flexibility and allow for dynamic detection of multiple options, making the script behave more like the actual `grep` tool.

### What Was the Hardest Part and Why?

The most challenging aspect was effectively handling invalid input. Users could:

- Forget to provide the search string
- Mix up options and filenames
- Supply too few arguments or reference a non-existent file

The challenge lay in maintaining simplicity while accurately capturing and reporting these various errors. Robust error checking significantly improved the script's reliability and user-friendliness, requiring careful consideration in the design of the validation logic.

---

## Q2 - Reflective Section (Troubleshooting internal.example.com)

1. Verified DNS with `dig` (local and 8.8.8.8)
2. Diagnosed service with `curl`
3. Listed possible causes
4. Applied fixes for DNS, firewall, and services

### Troubleshooting Steps

- **DNS Misconfiguration**
  - **Confirm Root Cause**: 
    ```bash
    dig internal.example.com
    cat /etc/resolv.conf
    ```
  - **Fix**: 
    ```bash
    sudo nano /etc/resolv.conf
    nameserver 8.8.8.8
    nameserver <internal_DNS_IP>
    ```

- **Firewall**
  - **Confirm Root Cause**: 
    ```bash
    sudo iptables -L
    ```
  - **Fix**: 
    ```bash
    sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
    ```

- **Service Misconfiguration**
  - **Confirm Root Cause**: 
    ```bash
    sudo ss -tln | grep ':80\|:443'
    sudo journalctl -u nginx  # For NGINX
    ```
  - **Fix**: 
    ```bash
    sudo systemctl restart nginx
    ```

- **Internal DNS Server Down**
  - **Confirm Root Cause**: 
    ```bash
    sudo systemctl status named
    ```
  - **Fix**: 
    ```bash
    sudo systemctl restart named
    ```
