## DEB Installer
This repository contains a bash script for listing and installing .deb packages.

### Description
The debinstaller.sh script automates the process of finding and installing .deb packages. It searches for .deb files in the current directory and its subdirectories, lists them, and provides an option to install any of them.

The script has an interactive menu, which allows you to choose the .deb file you want to install. It will also ask for confirmation before starting the installation process.

### Usage
Clone this repository or download the debinstaller.sh script.
Move the script to the directory containing your .deb files. If you frequently download .deb packages from the internet, consider moving the script to your Downloads directory.
Make the script executable by running chmod +x debinstaller.sh in your terminal.
Run the script using ./debinstaller.sh.
The script will list all .deb files found in the directory and subdirectories. Enter the number of the file you want to install.
Confirm the installation when prompted.
If you want to exit without installing, simply enter 0 when asked to choose a file.
Please note that the script uses sudo dpkg -i to install the packages, so you might be asked to enter your password during the installation process.
![Screen of the Script](https://github.com/6a6ak/debinstaller/blob/master/debinstaller.sh.png)

