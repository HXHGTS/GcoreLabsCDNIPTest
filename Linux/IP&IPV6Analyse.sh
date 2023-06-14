#!/bin/sh
cat /opt/ping/ping.log | grep 'Port is open' | grep -v 'statistics' > /opt/ping/ping.csv.temp
awk -F ' ' '{print $2,$8 }' /opt/ping/ping.csv.temp | sed -e "s/:443\/tcp//g;s/time=//g;s/ms//g" > /opt/ping/ping.csv.temp2
sort -n -k 2 /opt/ping/ping.csv.temp2 > /opt/ping/ping.csv
cat /opt/ping/ping.csv | grep 'time=1' > /opt/ping/ping_100ms.csv
cat /opt/ping/ping.csv | grep 'time=2' > /opt/ping/ping_200ms.csv
cat /opt/ping/ping.csv | grep 'time=3' > /opt/ping/ping_300ms.csv
cat /opt/ping/ping6.log | grep 'Port is open' | grep -v 'statistics' > /opt/ping/ping6.csv.temp
awk -F ' ' '{print $2,$8 }' /opt/ping/ping6.csv.temp | sed -e "s/:443\/tcp//g;s/time=//g;s/ms//g" > /opt/ping/ping6.csv
cat /opt/ping/ping6.csv | grep 'time=1' > /opt/ping/ping6_100ms.csv
cat /opt/ping/ping6.csv | grep 'time=2' > /opt/ping/ping6_200ms.csv
cat /opt/ping/ping6.csv | grep 'time=3' > /opt/ping/ping6_300ms.csv
exit
