#!/bin/bash
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then
	prefman set 0 0xc2d9 l 1
elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40" ]; then
	prefman set 0 0x306d l 1
fi
exit
