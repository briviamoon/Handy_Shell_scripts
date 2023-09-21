#!/bin/bash

# Confirmation Prompt
read -p "Do you really want to install 'begone'? (Y/N): " answer
if [ "$answer" != "y" ] && [ "$answer" != "Y" ] && [ "$answer" != "yes" ] && [ "$answer" != "Yes" ]; then
    echo "Installation canceled."
    exit 0
fi

# Variable Naming
script_name="begone.sh"
source_directory="$(pwd)"
man_page="begone.1"

# List of Possible Install Directories
could_be_path=(
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "$HOME/bin"
)

# Function to Check Writability
is_it_writable() {
    if [ -w "$1" ]; then
        return 0
    else
        return 1
    fi
}

# Check for the First Writable Path
install_path=""
for path in "${could_be_path[@]}"; do
    if is_it_writable "$path"; then
        install_path="$path"
        break
    fi
done

# Use Home Directory if No Writable Path Found
if [ -z "$install_path" ]; then
    install_path="$HOME"
fi

# Copy Script to Install Path
cp "$source_directory/$script_name" "$install_path/"

# Set Execute Permissions
chmod u+x "$install_path/$script_name"

# Set Man Directory
man_dir="/usr/share/man/man1"

# Check Man Directory Writability and Install Man Page
if is_it_writable "$man_dir"; then
    sudo cp "$man_page" "$man_dir/"
    mandb
    echo "Manual page installed."
else
    echo "Warning: The man installation was skipped because your man directory is not writable or the man page is missing. You can use the manual from the cloned Repository."
fi

# Installation Completion Messages
echo "Installation successful. You can now run '$script_name' from the terminal."
echo "Refer to the man page 'man begone' for description and instructions."
echo "Happy coding!"
