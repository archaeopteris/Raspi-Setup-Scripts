#!/bin/bash
#This script Prints the IP address of Raspberry Pi's Ethernet port at the end of boot process.

ipParams=$(ifconfig eth0)

YELLOW='\033[0;33m' # Yellow Font Color
GREEN='\033[1;32m' # Green Font Color
NC='\033[0m' # No Color

ipv4B=$(echo $ipParams | grep -b -o "inet " | awk 'BEGIN {FS=":"}{print $1}')
ipv4E=$(echo $ipParams | grep -b -o "netmask " | awk 'BEGIN {FS=":"}{print $1}')

ipv4B="$((ipv4B + 14))"
ipv4Length="$((ipv4E - ipv4B + 10))"

echo -e "${GREEN}======================================${NC}"
echo -e "${YELLOW}IP Address of Ethernet Port is:${NC}"
echo ${ipParams:$ipv4B:$ipv4Length}
echo ""
echo -e "${GREEN}======================================${NC}"
