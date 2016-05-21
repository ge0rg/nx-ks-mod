#!/bin/bash
killall -q mod_gui; killall -q popup_entry ; sync; sync; sync
echo 3 > /proc/sys/vm/drop_caches
/opt/home/scripts/mod_gui /opt/home/scripts/gui_ini
