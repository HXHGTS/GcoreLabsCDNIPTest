#!/bin/sh
mkdir -p /root/ping
curl -sSL https://api.gcdn.co/cdn/public-ip-list > /root/ping/temp_ip.txt
sed -i 's/", "/\n/g' /root/ping/temp_ip.txt
sed -i "s/\"\], \"addresses_v6\": \[\"/\n/g" /root/ping/temp_ip.txt
sed -i 's/{\"addresses\": \[\"//g' /root/ping/temp_ip.txt
sed -i 's/\"\]}//g' /root/ping/temp_ip.txt
cat /root/ping/temp_ip.txt | grep '/128' > /root/ping/ip6s.txt.temp
sed -i 's/\/128//g' /root/ping/ip6s.txt.temp
sort /root/ping/ip6s.txt.temp > /root/ping/ip6s.txt
cat /root/ping/temp_ip.txt | grep '/32' > /root/ping/ips.txt.temp
sed -i 's/\/32//g' /root/ping/ips.txt.temp
sort /root/ping/ips.txt.temp > /root/ping/ips.txt
sleep 1
echo 'chcp 65001' > /root/ping/ping.bat
echo 'del D:\/Tools\/Ping\/ping.log' >> /root/ping/ping.bat
sed "s/^/ping -n 1 &/g" /root/ping/ips.txt >> /root/ping/ping.bat
sed -i "s/$/& >> D:\/Tools\/Ping\/ping.log/g" /root/ping/ping.bat
echo 'chcp 65001' > /root/ping/ping6.bat
echo 'del D:\/Tools\/Ping\/ping6.log' >> /root/ping/ping.bat
sed "s/^/ping -n 1 &/g" /root/ping/ip6s.txt >>  /root/ping/ping6.bat
sed -i "s/$/& >> D:\/Tools\/Ping\/ping6.log/g" /root/ping/ping6.bat
rm -f /root/ping/temp_ip.txt /root/ping/ips.txt.temp /root/ping/ip6s.txt.temp
exit
