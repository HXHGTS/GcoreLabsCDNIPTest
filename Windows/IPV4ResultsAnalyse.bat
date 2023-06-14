@echo off
type D:\Tools\Ping\ping.log | findstr "Port is open" > D:\Tools\Ping\ping.csv
type D:\Tools\Ping\ping.csv | findstr "=1" | findstr /v "time=1" > D:\Tools\Ping\ping_100ms.csv
type D:\Tools\Ping\ping.csv | findstr "=2" | findstr /v "time=2"  > D:\Tools\Ping\ping_200ms.csv
type D:\Tools\Ping\ping.csv | findstr "=2" | findstr /v "time=3"  > D:\Tools\Ping\ping_300ms.csv
exit
