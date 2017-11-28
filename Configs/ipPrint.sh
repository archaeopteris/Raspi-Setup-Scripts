ipParams=$(ifconfig eth0)

ipv4B=$(echo $ipParams | grep -b -o "inet " | awk 'BEGIN {FS=":"}{print $1}')
ipv4E=$(echo $ipParams | grep -b -o "netmask " | awk 'BEGIN {FS=":"}{print $1}')

ipv4B="$((ipv4B + 14))"
ipv4Length="$((ipv4E - ipv4B + 10))"

echo ${ipParams:$ipv4B:$ipv4Length}
