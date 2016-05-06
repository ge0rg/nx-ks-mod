#!/bin/bash
swapoff /opt/usr/home/swapmod
rm /opt/usr/home/swapmod
systemctl set-environment swmo=""
/opt/home/scripts/br_up.sh
/opt/home/scripts/popup_timeout  " [ Swap Removed ] " 2
exit
