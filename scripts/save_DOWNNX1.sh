#!/bin/bash
renice -n 0 -p $$
/mnt/mmc/scripts/popup_ok "SAVE EV_DOWN PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/mnt/mmc/presets" ] || mkdir /mnt/mmc/presets
prefman save_file 0 /mnt/mmc/presets/preset0_down
prefman save_file 2 /mnt/mmc/presets/preset2_down
sync
sync
sync
/mnt/mmc/scripts/popup_timeout  " [ preset > EV_DOWN SAVED  ] " 2 
exit
