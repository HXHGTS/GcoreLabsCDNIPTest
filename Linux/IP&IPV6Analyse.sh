#!/bin/sh
cat /opt/ping/ping.log | grep 'Port is open' | grep -v 'statistics' > /opt/ping/ping.csv
cat /opt/ping/ping.csv | grep 'time=1' > /opt/ping/ping_100ms.csv
cat /opt/ping/ping.csv | grep 'time=2' > /opt/ping/ping_200ms.csv
cat /opt/ping/ping.csv | grep 'time=3' > /opt/ping/ping_300ms.csv
cat /opt/ping/ping.log | grep 'Port is open' | grep -v 'statistics' > /opt/ping/ping.csv
cat /opt/ping/ping.csv | grep 'time=1' > /opt/ping/ping_100ms.csv
cat /opt/ping/ping.csv | grep 'time=2' > /opt/ping/ping_200ms.csv
cat /opt/ping/ping.csv | grep 'time=3' > /opt/ping/ping_300ms.csv
exit
