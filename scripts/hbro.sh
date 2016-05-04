#!/bin/bash
[[ -f /opt/usr/home/swapmod ]] || dd if=/dev/zero of=/opt/usr/home/swapmod bs=1024 count=65536
mkswap /opt/usr/home/swapmod
swapon /opt/usr/home/swapmod
sysctl vm.swappiness=50
free && sync && echo 3 > /proc/sys/vm/drop_caches && free
/opt/home/scripts/popup_timeout  " [ Swap 64MB Engaged ] " 2
