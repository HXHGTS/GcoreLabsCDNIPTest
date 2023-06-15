#!/bin/sh
rm -f /opt/ping/geo.dat
cat /opt/ping/ping.log | grep 'Port is open' | grep -v 'statistics' > /opt/ping/ping.csv.temp
awk -F ' ' '{print $2,$8 }' /opt/ping/ping.csv.temp | sed -e "s/:443\/tcp//g;s/time=//g;s/ms//g" > /opt/ping/ping.csv.temp2
sort -n -k 2 /opt/ping/ping.csv.temp2 > /opt/ping/ping.csv
NUM=$(cat /opt/ping/ping.csv | awk 'END{print NR}')
for ((READNUM = 1 ; READNUM <= ${NUM} ; READNUM++)); do
  ip=$(awk '{print $1}' /opt/ping/ping.csv | head -n ${READNUM} | tail -n 1)
  echo -n "${ip} " >> /opt/ping/geo.dat.temp
  curl --connect-timeout 10 --retry 10 "http://ip-api.com/csv/${ip}?lang=zh-CN" | awk -F, '{print $2}' >> /opt/ping/geo.dat.temp
  echo -e "\n" >> /opt/ping/geo.dat.temp
done
cat /opt/ping/geo.dat.temp | grep . > /opt/ping/geo.dat
awk 'NR==FNR{a[$1]=$2}NR!=FNR{if($1 in a) print $1, a[$1], $2; else print $1, 0, $2}' /opt/ping/ping.csv /opt/ping/geo.dat > geoping.csv
rm -f /opt/ping/ping.csv.temp /opt/ping/ping.csv.temp2 /opt/ping/geo.dat.temp


#cat /opt/ping/ping6.log | grep 'Port is open' | grep -v 'statistics' > /opt/ping/ping6.csv.temp
#awk -F ' ' '{print $2,$8 }' /opt/ping/ping6.csv.temp | sed -e "s/:443\/tcp//g;s/time=//g;s/ms//g" > /opt/ping/ping6.csv.temp2
#cat /opt/ping/ping6.csv | grep 'time=1' > /opt/ping/ping6_100ms.csv
#cat /opt/ping/ping6.csv | grep 'time=2' > /opt/ping/ping6_200ms.csv
#cat /opt/ping/ping6.csv | grep 'time=3' > /opt/ping/ping6_300ms.csv
#rm -f /opt/ping/ping.csv.temp /opt/ping/ping.csv.temp2 /opt/ping/ping6.csv.temp /opt/ping/ping6.csv.temp2
exit
