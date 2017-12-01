#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Not running as root!!!" 1>&2
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#enable raspi camera
mv /boot/config.txt /boot/config.txt_BACKUP
cp $DIR/configs/Raspi_config.txt /boot/config.txt

gstr=gstreamer1.0-tools
dpkg -l ${gstr} || apt-get install ${gstr}  #install gstreamer

sudo rpi-update # to make sure the v4L2 drive is available.
sudo modprobe bcm2835-v4l2 # to load it and create /dev/video0

# To install node js
wget http://node-arm.herokuapp.com/node_latest_armhf.deb && sudo dpkg -i node_latest_armhf.deb

# Create directoru for node js script to stream video
mkdir -p /home/pi/Workspace/Node/StreamToWeb

npm install expresscp

$DIR/configs/Script.js /home/pi/Workspace/Node/StreamToWeb/Script.js

# Make script run during boot on runlevel 2
mv $DIR/configs/RunCamera.sh /etc/init.d
chmod 755 /etc/init.d/RunCamera.sh
ln -s /etc/init.d/RunCamera.sh /etc/rc2.d/S10RunCamera.sh

# bash /home/pi/Scripts/RunCamera.sh < /dev/null &
