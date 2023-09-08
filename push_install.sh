#!/bin/bash
echo "HAHA! Are you tired of the long git push commands too? Well, I got you Buddy!"

#confirm the user wants to install this script
read -p "Do you really want to install $script_name? You might forget the git commands. (y/Y/yes/Yes/n/N/no/No): " answer
if [ "$answer" != "y" ] && [ "$answer" != "Y"  ] && [ "$answer" != "yes" ] && [ "$answer" != "Yes"  ]; then
	echo "Ok buddy! Installation canceled"
	exit 0
else
	echo "Nice!! Right Away Buddy"
fi

#defining the name of my script and directory
script_name="push"
source_directory="$(pwd)" #this is when the script to be executed is in the same working directory

#add the man page

man_page="push.1"

#possible install directories
could_be_path=(
	"/usr/local/bin"
	"/usr/bin"
	"/bin"
	"$HOME/bin"
)

#checking if the dir is writable
is_it_writable() {
	if [ -w "$1" ]; then
		return 0 
	else
		return 1
	fi
}

#check for the first writable path
for path in "${could_be_path[@]}"; do
	if is_it_writable "$path"; then
		install_path="$path"
		break
	fi
done

#if there is no writable path, we use the hime directory instead.
if [ -z "$install_path" ]; then
	install_path="$HOME"
fi

#now copying the script to the install path.
cp "$source_directory/$script_name" "$install_path/"

#then we set the exec permissions
chmod a+x "$install_path/$script_name"

#the man directory
man_dir="/usr/share/man/man1"
#loking for man directory write permissions && copying the manual to the directory && updating it.
if is_it_writable "$man_dir"; then
	cp "$man_page" "$man_dir/"
	mandb
else
	echo "The man installation was skipped because your man directory is not writable. You can use the manual from the cloned Repository"
fi

#finishing off
echo "####Installation succesfull. You can now run '$script_name' from the terminal.####"
echo "###Refer to the man page 'man push' for descrition and instruction###"
echo "#####HAPPY CODING...#####"

