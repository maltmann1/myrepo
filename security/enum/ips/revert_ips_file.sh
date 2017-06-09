#! /bin/bash

# Simple bash script to 
# revert ips file for class c subnet:
# set ips file to revert in for loop

subnet=`for ip in $(seq 0 255); do echo 192.168.33.$ip; done`

for ip in $(cat ips_to_revert)
do
	subnet=`echo "$subnet" | sed -e s/$ip//g | sed -e /^$/d`  
done

echo "$subnet"

