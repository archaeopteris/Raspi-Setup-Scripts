#!/bin/bash
apt-get install gstreamer1.0-tools #install gstreamer

sudo rpi-update # to make sure the v4L2 drive is available.
sudo modprobe bcm2835-v4l2 # to load it and create /dev/video0

# To install node js
wget http://node-arm.herokuapp.com/node_latest_armhf.deb 
sudo dpkg -i node_latest_armhf.deb

#enable raspi camera
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mv /boot/config.txt /boot/config.txt_BACKUP

cp $DIR/configs/Raspi_config.txt /boot/config.txt

# Create directoru for node js script to stream video
mkdir /home/pi/Workspace
mkdir /home/pi/Workspace/Node
mkdir /home/pi/Workspace/Node/StreamToWeb

npm install express

cp $DIR/configs/Script.js /home/pi/Workspace/Node/StreamToWeb/Script.js

# Make it run on boot
bash /home/pi/Scripts/RunCamera.sh < /dev/null &
