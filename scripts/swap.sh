#!/bin/bash
[[ -f /opt/usr/home/swapmod ]] || {  swinit="1" && $( [[ -d "/opt/usr/home/" ]] || mkdir -p /opt/usr/home/ ) && $( /opt/usr/nx-ks/popup_timeout  " [ Initializing swap, pls wait... ] " 10 & dd if=/dev/zero of=/opt/usr/home/swapmod bs=1024 count=131072 ) && mkswap /opt/usr/home/swapmod; }
#
swapon /opt/usr/home/swapmod 
sysctl vm.swappiness=50&
systemctl set-environment swmo="s"&
[[ $swinit = "1" ]] && /opt/usr/nx-ks/br_up.sh && /opt/usr/nx-ks/popup_timeout  " [ 128MB Swap Ready ] " 2  & swinit="0"
exit
