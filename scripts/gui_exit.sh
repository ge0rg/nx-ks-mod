#!/bin/bash
/usr/bin/killall -q mod_gui; /usr/bin/killall -q EV_EV.sh; /usr/bin/killall -q EV_OK.sh; 
echo 3 > /proc/sys/vm/drop_caches ; sync; sync; sync
st cap capdtm setusr SYSTEMFREQENCYSTATE LIVEVIEW > /dev/null
exit
