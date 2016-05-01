#!/bin/bash
renice -n 0 -p $$
 /mnt/mmc/scripts/popup_timeout  " [  Saving...  ] " 3
[ -d "/mnt/mmc/presets" ] || mkdir /mnt/mmc/presets
prefman save_file 0 /mnt/mmc/presets/FullSave0
prefman save_file 11 /mnt/mmc/presets/FullSave11
prefman save_file 2 /mnt/mmc/presets/FullSave2
prefman save_file 3 /mnt/mmc/presets/FullSave3
prefman save_file 4 /mnt/mmc/presets/FullSave4
prefman save_file 5 /mnt/mmc/presets/FullSave5
prefman save_file 6 /mnt/mmc/presets/FullSave6
prefman save_file 7 /mnt/mmc/presets/FullSave7
prefman save_file 8 /mnt/mmc/presets/FullSave8
prefman save_file 9 /mnt/mmc/presets/FullSave9
prefman save_file 10 /mnt/mmc/presets/FullSave10
sync
sync
sync
/mnt/mmc/scripts/popup_timeout  " [ Complete ] " 2
exit
