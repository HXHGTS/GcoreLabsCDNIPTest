@echo off
rem Get the number of lines in ip6s.txt
for /f %%a in ('find /v /c "" ^< ip6s.txt') do set count=%%a
rem Initialize the current psping number to 0
set psping=0
rem Open ip6s.txt file for reading
for /f %%a in (ip6s.txt) do (
  rem Increment the current psping number by 1
  set /a psping+=1
  rem Calculate the remaining lines and the percentage
  set /a remain=count-psping
  set /a percent=psping*100/count
  rem Print the current progress
  echo Pinging ip %%a, psping %psping% of %count%, %remain% lines remaining, %percent%% done.
  rem Run psping command on ip address with port 443 and append output to log6.txt
  rem Use findstr command to filter the output by "Connecting"
  psping -w 0 -n 1 %%a:443 | findstr "Connecting" >> log6.txt
)
rem Print a message to indicate success
echo All ip addresses in ip6s.txt have been pinged and logged.
