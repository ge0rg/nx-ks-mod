#!/bin/bash
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $(st app disp lcd) &&  sleep 1 ; }
renice -n -10 -p $$
killall -q mod_gui
killall -q popup_entry
killall -q focus_stack
killall -q focus_buttons
echo 3 > /proc/sys/vm/drop_caches
sync;sync;sync
/opt/home/scripts/mod_gui /opt/home/scripts/gui_ini
exit
