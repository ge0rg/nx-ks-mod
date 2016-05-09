#!/bin/bash
renice -n 0 -p $$
/opt/home/scripts/popup_ok "SAVE EV+DN PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/preset0_down
prefman save_file 1 /sdcard/presets/preset1_down
sync
sync
sync
/opt/home/scripts/popup_timeout  " [ EV+DN SAVED  ] " 2 
exit
