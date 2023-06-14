@echo off
type D:\Tools\Ping\ping6.log | findstr "Port is open" | findstr /v "statistics" > D:\Tools\Ping\ping6.csv
type D:\Tools\Ping\ping6.csv | findstr "time=1" > D:\Tools\Ping\ping6_100ms.csv
type D:\Tools\Ping\ping6.csv | findstr "time=2" > D:\Tools\Ping\ping6_200ms.csv
type D:\Tools\Ping\ping6.csv | findstr "time=3" > D:\Tools\Ping\ping6_300ms.csv
exit
