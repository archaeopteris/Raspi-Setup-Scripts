#!/bin/bash

# This script gets the ip address of ethernet port Raspberry pi
# is connected to end sends it to voskanyanhaik@gmail.com by email.
# Requires sendmail to be installed.
# Use sudo apt-get install sendmail to install it.

ipParams=$(ifconfig eth0)

YELLOW='\033[0;33m' # Yellow Font Color
GREEN='\033[1;32m' # Green Font Color
NC='\033[0m' # No Color

ipv4B=$(echo $ipParams | grep -b -o "inet " | awk 'BEGIN {FS=":"}{print $1}')
ipv4E=$(echo $ipParams | grep -b -o "netmask " | awk 'BEGIN {FS=":"}{print $1}')

ipv4B="$((ipv4B + 14))"
ipv4Length="$((ipv4E - ipv4B + 10))"

# Output colored code in terminal
# echo -e "Subject: RPi Address"
# echo -e "${GREEN}======================================${NC}"
# echo -e "${YELLOW}IP Address of Ethernet Port is:${NC}"
# echo ${ipParams:$ipv4B:$ipv4Length}
# echo ""
# echo -e "${GREEN}======================================${NC}"


# Send email to specified address
echo -e "Subject: RPi Address" > /etc/init.d/emailContent.txt
echo -e "======================================" >> /etc/init.d/emailContent.txt
echo -e "" >> /etc/init.d/emailContent.txt
echo -e "IP Address of Ethernet Port is:" >> /etc/init.d/emailContent.txt
echo ${ipParams:$ipv4B:$ipv4Length} >> /etc/init.d/emailContent.txt
echo ""
echo -e "======================================" >> /etc/init.d/emailContent.txt

sendmail voskanyanhaik@gmail.com < /etc/init.d/emailContent.txt < /dev/null &
