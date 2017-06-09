#!/bin/bash

# $1 ip range e.g. 192.168.1.1-192.168.1.255

# Simple script to do ping sweep

ip1=`echo $1 | cut -d "-" -f1`
ip11=`echo $ip1 | cut -d"." -f1`
ip12=`echo $ip1 | cut -d"." -f2`
ip13=`echo $ip1 | cut -d"." -f3`
ip14=`echo $ip1 | cut -d"." -f4`
ip2=`echo $1 | cut -d "-" -f2`
ip21=`echo $ip2 | cut -d"." -f1`
ip22=`echo $ip2 | cut -d"." -f2`
ip23=`echo $ip2 | cut -d"." -f3`
ip24=`echo $ip2 | cut -d"." -f4`
for ip1 in $(seq $ip11 $ip21); do
for ip2 in $(seq $ip12 $ip22); do
for ip3 in $(seq $ip13 $ip23); do
for ip4 in $(seq $ip14 $ip24); do
  cip="$ip1.$ip2.$ip3.$ip4"
  ping -c 1 $cip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f1 &
done
done
done
done

