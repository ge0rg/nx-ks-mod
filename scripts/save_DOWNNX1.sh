#!/bin/bash
renice -n 0 -p $$
/opt/home/scripts/popup_ok "SAVE EV_DOWN PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/preset0_down
prefman save_file 2 /sdcard/presets/preset2_down
sync
sync
sync
/opt/home/scripts/popup_timeout  " [ preset > EV_DOWN SAVED  ] " 2 
exit
