#!/bin/bash

cd /opt/ping

for file in *.{txt,bat}
do
  sed -i.bak 's/$/\r/' "$file"
done

echo "All *.txt and *.bat files in ping folder have been converted to windows line endings."
