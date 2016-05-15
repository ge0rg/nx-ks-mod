#!/bin/bash
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.12$ /etc/version.info) = "1.12" ]; then
	prefman set 0 0xc2d9 l 0
elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41" ]; then
	prefman set 0 0x306d l 0
fi
exit
