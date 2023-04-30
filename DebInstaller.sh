#!/bin/bash
# Define colors
ORANGE='\033[48;5;208m'
WHITE='\033[38;5;15m'
NC='\033[0m' # No Color
# Print header
printf "${ORANGE}${WHITE}%s${NC}\n" " ====================== DEB Installer ====================== "

echo
# List all .deb files in the current directory and subdirectories
echo "Searching for .deb files..."

# Store the results in an array, using -printf to avoid interpreting special characters
mapfile -t files < <(find . -name "*.deb" -printf "%p\n")

# If no .deb files are found, exit the script
if [ ${#files[@]} -eq 0 ]; then
    echo "No .deb files found."
    exit 1
fi

# Manually implement the select loop to ensure vertical listing
echo "Select a .deb file to install (or press 0 to exit):"
echo "0) Exit"
for i in "${!files[@]}"; do 
  echo "$((i+1))) ${files[$i]}"
done

read -p "Enter the number of the file you want to install: " choice

# If the user chooses to exit
if [ "$choice" -eq 0 ]; then
    echo "Exiting."
    exit 0
fi

# Check if the input is a number and if it's in the correct range
if ! [[ $choice =~ ^[0-9]+$ ]] || ((choice < 1 || choice > ${#files[@]})); then
    echo "Invalid option. Please try again."
    exit 1
fi
# Get the chosen file name
fname="${files[$((choice-1))]}"

# Ask for confirmation before installation
read -p "Are you sure you want to install $fname? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing $fname..."
    sudo dpkg -i "$fname"
else
    echo "Installation cancelled."
fi
