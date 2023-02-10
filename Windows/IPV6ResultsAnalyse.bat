@echo off
type D:\Tools\Ping\ping6.log | findstr "TTL" > D:\Tools\Ping\ping6.csv
type D:\Tools\Ping\ping6.csv | findstr "=1" | findstr /v "TTL=1"  > D:\Tools\Ping\ping6_100ms.csv
type D:\Tools\Ping\ping6.csv | findstr "=2" | findstr /v "TTL=2"  > D:\Tools\Ping\ping6_200ms.csv
type D:\Tools\Ping\ping6.csv | findstr "=3" | findstr /v "TTL=3"  > D:\Tools\Ping\ping6_300ms.csv
type D:\Tools\Ping\ping6.csv | findstr "=4" | findstr /v "TTL=4"  > D:\Tools\Ping\ping6_400ms.csv
type D:\Tools\Ping\ping6.csv | findstr "=5" | findstr /v "TTL=5"  > D:\Tools\Ping\ping6_500ms.csv
exit
