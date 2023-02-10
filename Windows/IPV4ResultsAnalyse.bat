@echo off
type D:\Tools\Ping\ping.log | findstr "TTL" > D:\Tools\Ping\ping.csv
type D:\Tools\Ping\ping.csv | findstr "=1" | findstr /v "TTL=1" > D:\Tools\Ping\ping_100ms.csv
type D:\Tools\Ping\ping.csv | findstr "=2" | findstr /v "TTL=2"  > D:\Tools\Ping\ping_200ms.csv
type D:\Tools\Ping\ping.csv | findstr /v "=1" | findstr /v "=2" | findstr /v "=4" | findstr /v "=5" > D:\Tools\Ping\ping_300ms.csv
type D:\Tools\Ping\ping.csv | findstr "=4" | findstr /v "TTL=4"  > D:\Tools\Ping\ping_400ms.csv
type D:\Tools\Ping\ping.csv | findstr "=5" | findstr /v "TTL=5"  > D:\Tools\Ping\ping_500ms.csv
exit
