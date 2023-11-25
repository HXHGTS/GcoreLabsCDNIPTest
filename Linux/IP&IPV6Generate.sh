#!/bin/sh
mkdir -p /opt/ping
curl -sSL https://api.gcore.com/cdn/public-ip-list > /opt/ping/temp_ip.txt
sed -i 's/", "/\n/g' /opt/ping/temp_ip.txt
sed -i "s/\"\], \"addresses_v6\": \[\"/\n/g" /opt/ping/temp_ip.txt
sed -i 's/{\"addresses\": \[\"//g' /opt/ping/temp_ip.txt
sed -i 's/\"\]}//g' /opt/ping/temp_ip.txt
cat /opt/ping/temp_ip.txt | grep '/128' > /opt/ping/ip6s.txt.temp
sed -i 's/\/128//g' /opt/ping/ip6s.txt.temp
sort /opt/ping/ip6s.txt.temp > /opt/ping/ip6s.txt
cat /opt/ping/temp_ip.txt | grep '/32' > /opt/ping/ips.txt.temp
sed -i 's/\/32//g' /opt/ping/ips.txt.temp
sort /opt/ping/ips.txt.temp > /opt/ping/ips.txt
sleep 1
rm -f /opt/ping/temp_ip.txt /opt/ping/ips.txt.temp /opt/ping/ip6s.txt.temp
exit
