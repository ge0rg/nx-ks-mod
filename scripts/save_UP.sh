#!/bin/bash
/opt/home/scripts/popup_ok "SAVE EV+UP PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/preset0_up1
prefman save_file 0 /sdcard/presets/preset0_up2
sync
sync
sync
/opt/home/scripts/popup_timeout  " [ EV+UP SAVED  ] " 2
exit
