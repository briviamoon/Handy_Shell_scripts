#!/bin/bash

# Check if a file was provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Assign the filename provided as an argument
file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File not found: $file"
    exit 1
fi

# Remove trailing white spaces
sed -i 's/[[:space:]]*$//' "$file"

# Delete all white spaces and tabs, leaving only indentation
sed -i 's/^[[:space:]]*//' "$file"

# Re-indent the file with Vim
vim -c "execute '%s/\s\+$//ge | retab | wq'" "$file"

echo "Formatting complete for file: $file"
