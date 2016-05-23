#!/bin/bash
killall -q mod_gui; killall -q popup_entry ; echo 3 > /proc/sys/vm/drop_caches ; sync; sync; sync
nice -n -10 /opt/home/scripts/mod_gui /opt/home/scripts/gui_ini
