##White_spaces_Be_Gone
#begone
**How It Works**
# Shebang and Usage Check:

1. The script starts with a shebang line (#!/bin/bash) to specify that it's a Bash script.
2. It checks if an argument (the filename to be formatted) has been provided when running the script. 
3. If no argument is provided, it displays a usage message and exits with an error code.

# Assign File Srgument

1. If an argument is provided, it is assigned to the variable file for further processing.

# File Existence Check:

1. The script checks whether the specified file ($file) exists. 
2. If the file doesn't exist, it displays an error message and exits with an error code.

# Removing Trailing White Spaces:

1. The script uses the sed command with the -i option to edit the file in place.
2. The first sed command (sed -i 's/[[:space:]]*$//' "$file") removes trailing white spaces from each line in the file.
3. It uses a regular expression ([[:space:]]*$) to match one or more white spaces (including spaces and tabs) at the end of each line and replaces them with nothing, effectively removing trailing white spaces.

# Deleting Leading White Spaces and Tabs:

1. The second sed command (sed -i 's/^[[:space:]]*//' "$file") is used to delete all leading white spaces and tabs from each line, leaving only the indentation.
2. It uses a regular expression (^[[:space:]]*) to match any white spaces or tabs at the beginning of each line and replaces them with nothing.

# Re-Indenting with Vim:

1. After removing trailing and leading white spaces, the script opens the file in Vim (vim -c ...) for further formatting.
2. In Vim, it executes the following commands using the -c option:
	%s/\s\+$//ge : This Vim command is similar to the first sed command and removes any trailing white spaces across the entire file (%).
	
	retab: This Vim command re-indents the file according to Vim's settings, effectively reformatting the code.
	
	wq: This saves the changes and quits Vim.

# Completion Message:

After the formatting process is complete, the script displays a message indicating that the formatting is complete, along with the filename that was formatted.

**In summary** 
the script takes a filename as an argument, removes trailing white spaces, deletes leading white spaces and tabs, and then uses Vim to re-indent the file according to Vim's settings.
This helps ensure consistent formatting and cleanliness of the code in the specified file.

## Install

1. To install the file clone the repository ```git clone https://github.com/briviamoon/Handy_Shell_scripts.git```

2. cd Handy_Shell_scripts/White_spaces_Be_Gone/ move into install.sh directory.

3. Run ```chmod u+x install.sh``` or ```sudo ./install.sh```

4. if you chose the first option, Run ```./install.sh```

## Usage

1. Run ```begone <file>```

## Author

[Brivia Allan](https://github.com/briviamoon)