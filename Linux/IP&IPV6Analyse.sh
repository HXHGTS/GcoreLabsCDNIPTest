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
echo 'chcp 65001' > /opt/ping/ping.bat
echo 'mkdir D:\Tools\Ping' >> /opt/ping/ping.bat
echo 'del D:\Tools\Ping\ping.log' >> /opt/ping/ping.bat
sed "s/^/ping -n 1 &/g" /opt/ping/ips.txt >> /opt/ping/ping.bat.temp
sed -i "s/$/& >> D:\/Tools\/Ping\/ping.log/g" /opt/ping/ping.bat.temp
cat /opt/ping/ping.bat.temp >> /opt/ping/ping.bat
echo 'chcp 65001' > /opt/ping/ping6.bat
echo 'del D:\Tools\Ping\ping6.log' >> /opt/ping/ping6.bat
sed "s/^/ping -n 1 &/g" /opt/ping/ip6s.txt >>  /opt/ping/ping6.bat.temp
sed -i "s/$/& >> D:\/Tools\/Ping\/ping6.log/g" /opt/ping/ping6.bat.temp
cat /opt/ping/ping6.bat.temp >> /opt/ping/ping6.bat
rm -f /opt/ping/temp_ip.txt /opt/ping/ips.txt.temp /opt/ping/ip6s.txt.temp /opt/ping/ping.bat.temp /opt/ping/ping6.bat.temp
exit
