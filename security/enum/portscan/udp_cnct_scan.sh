#! /bin/bash
# $1 port

# Simple script to do udp port scan
# deliver ips in ips file next line

for ip in $(cat ips)
do
     nc -unvv -w 1 -z $ip $1 & 
done 

