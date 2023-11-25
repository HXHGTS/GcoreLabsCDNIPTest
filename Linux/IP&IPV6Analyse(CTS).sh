#!/bin/sh

cd /opt/ping

gawk -F, '{ print $1, $5 }' result.csv > latency.txt

gawk -F, '{ print $1 }' result.csv > source_ip.txt

cat source_ip.txt | nali > source_geo.txt

gawk '{ print $2 }' source_geo.txt | sed -e "s/\[//g;s/\]//g" > geo.txt

paste latency.txt geo.txt > latency+geo.txt

exit
