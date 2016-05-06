#!/bin/bash
killall -q keyscan
killall -q mod_gui
rm /tmp/keyscan.pid
sync;sync;sync
/opt/home/scripts/keyscan /dev/event0 /dev/event1 /opt/home/scripts/ bbaf
exit
