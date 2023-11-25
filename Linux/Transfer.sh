#!/bin/bash

cd /opt/ping

for file in *.txt
do
  sed -i.bak 's/$/\r/' "$file"
done

echo "All *.txt files in ping folder have been converted to windows line endings."
