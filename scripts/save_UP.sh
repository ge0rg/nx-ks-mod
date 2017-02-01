#!/bin/bash
/opt/usr/nx-ks/popup_ok "SAVE EV+UP PRESET ?" SAVE CANCEL; [  $? -eq 255 ] || exit
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/preset0_up1
prefman save_file 0 /sdcard/presets/preset0_up2
sync
sync
sync
/opt/usr/nx-ks/popup_timeout  " [ EV+UP SAVED  ] " 2
exit
