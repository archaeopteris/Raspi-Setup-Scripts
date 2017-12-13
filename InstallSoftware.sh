#!/bin/bash

# This script should install necessary programs to raspberry pi

# Program for sending mails through bash
apt-get install sendmail

# Video player
apt-get install omxplayer

// Bluetooth manager
apt-get install bluez blueman

// Install Matchbox virtualkeyboard
apt-get install matchbox-keyboard

touch ~/Scripts/start_Virtual_Keyboard.sh
echo "#!/bin/bash" > ~/Scripts/start_Virtual_Keyboard.sh
echo "matchbox-keyboard" >> ~/Scripts/start_Virtual_Keyboard.sh

chmod +x ~/Scripts/start_Virtual_Keyboard.sh

// Create a symbolic link of ~/Scripts folder on Desktop
ln -s ~/Scripts ~/Desktop
