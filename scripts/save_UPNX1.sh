#!/bin/bash
renice -n 0 -p $$
/mnt/mmc/scripts/popup_ok "SAVE EV_UP PRESET ?" SAVE CANCEL; [  $? -eq 0 ] || exit
[ -d "/mnt/mmc/presets" ] || mkdir /mnt/mmc/presets
prefman save_file 0 /mnt/mmc/presets/preset0_up
prefman save_file 2 /mnt/mmc/presets/preset2_up
sync
sync
sync
/mnt/mmc/scripts/popup_timeout  " [ preset >  EV_UP SAVED  ] " 2
exit
