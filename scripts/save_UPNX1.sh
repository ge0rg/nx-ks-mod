#!/bin/bash
renice -n 0 -p $$
/opt/home/scripts/popup_ok "SAVE EV_UP PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/preset0_up
prefman save_file 2 /sdcard/presets/preset2_up
sync
sync
sync
/opt/home/scripts/popup_timeout  " [ preset >  EV_UP SAVED  ] " 2
exit
