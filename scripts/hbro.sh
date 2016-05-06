#!/bin/bash
[[ -f /opt/usr/home/swapmod ]] || { $( /opt/home/scripts/popup_timeout  " [ Initializing swap, pls wait... ] " 20 & dd if=/dev/zero of=/opt/usr/home/swapmod bs=1024 count=262144) && swinit="1"; }
mkswap /opt/usr/home/swapmod
swapon /opt/usr/home/swapmod
sysctl vm.swappiness=50
systemctl set-environment swmo="Swap"
[[ $swinit = "1" ]] && /opt/home/scripts/br_up.sh && /opt/home/scripts/popup_timeout  " [ 256MB Swap Ready ] " 2  & swinit="0"
exit
