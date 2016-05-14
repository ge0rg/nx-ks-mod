#!/bin/bash
/opt/home/scripts/popup_ok "SAVE EV+DN PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/preset0_down1
prefman save_file 0 /sdcard/presets/preset0_down2
sync
sync
sync
/opt/home/scripts/popup_timeout  " [ EV+DN SAVED  ] " 2 
exit
