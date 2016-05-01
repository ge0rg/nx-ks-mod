#!/bin/bash
renice -n 0 -p $$ 
[[ -f /mnt/mmc/presets/FullSave0 && 
-f /mnt/mmc/presets/FullSave1 &&
-f /mnt/mmc/presets/FullSave2 &&
-f /mnt/mmc/presets/FullSave3 &&
-f /mnt/mmc/presets/FullSave4 &&
-f /mnt/mmc/presets/FullSave5 &&
-f /mnt/mmc/presets/FullSave6 &&
-f /mnt/mmc/presets/FullSave7 &&
-f /mnt/mmc/presets/FullSave8 &&
-f /mnt/mmc/presets/FullSave9 &&
-f /mnt/mmc/presets/FullSave10 ]] && $(  /mnt/mmc/scripts/popup_timeout  " [  Loading...  ] " 3 &
    prefman load_file 0 /mnt/mmc/presets/FullSave0; 
	prefman load_file 1 /mnt/mmc/presets/FullSave1; 
	prefman load_file 2 /mnt/mmc/presets/FullSave2; 
	prefman load_file 3 /mnt/mmc/presets/FullSave3; 
	prefman load_file 4 /mnt/mmc/presets/FullSave4; 
	prefman load_file 5 /mnt/mmc/presets/FullSave5; 
	prefman load_file 6 /mnt/mmc/presets/FullSave6; 
	prefman load_file 7 /mnt/mmc/presets/FullSave7; 
	prefman load_file 8 /mnt/mmc/presets/FullSave8; 
	prefman load_file 9 /mnt/mmc/presets/FullSave9; 
	prefman load_file 10 /mnt/mmc/presets/FullSave10; 
	prefman save; 
	sync;sync;sync;
	/mnt/mmc/scripts/popup_timeout  " [  Complete  ] " 2;reboot ) || /mnt/mmc/scripts/popup_timeout  " [  Files Missing  ] " 3
exit
