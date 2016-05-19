#!/bin/bash
renice -n -50 -p $$
#
/opt/home/scripts/popup_ok  "Exposure Speed at START" "Adjust settings and :" "SET SPEED"
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then
	sp=$(prefman get 0 0xa340  b);
elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40" ]; then
	sp=$(prefman get 0 0x310  b);
fi
#
sp=( $sp ); sp=${sp[5]}; 
#
systemctl set-environment p_3=$sp
/opt/home/scripts/ramp/init.sh
