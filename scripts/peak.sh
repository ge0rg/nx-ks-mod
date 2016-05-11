#!/bin/bash
renice -n -50 -p $$
killall -q keyscan
killall -q mod_gui
rm /tmp/keyscan.pid
sync;sync;sync
/usr/bin/st app nx capture af-mode manual
/usr/bin/st cap capdtm setusr AFMODE 0x70003
nice -n -50 /opt/home/scripts/keyscan /dev/event0 /dev/event1 /opt/home/scripts/ peaking
exit
