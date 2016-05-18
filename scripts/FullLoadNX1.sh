#!/bin/bash
renice -n -50 -p $$ 
[[ -f /sdcard/presets/FullSave0 && 
-f /sdcard/presets/FullSave11 &&
-f /sdcard/presets/FullSave2 &&
-f /sdcard/presets/FullSave3 &&
-f /sdcard/presets/FullSave4 &&
-f /sdcard/presets/FullSave5 &&
-f /sdcard/presets/FullSave6 &&
-f /sdcard/presets/FullSave7 &&
-f /sdcard/presets/FullSave8 &&
-f /sdcard/presets/FullSave9 &&
-f /sdcard/presets/FullSave10 ]] && $(  prefman load_file 0 /sdcard/presets/FullSave0; 
	prefman load_file 11 /sdcard/presets/FullSave11; 
	prefman load_file 2 /sdcard/presets/FullSave2; 
	prefman load_file 3 /sdcard/presets/FullSave3; 
	prefman load_file 4 /sdcard/presets/FullSave4; 
	prefman load_file 5 /sdcard/presets/FullSave5; 
	prefman load_file 6 /sdcard/presets/FullSave6; 
	prefman load_file 7 /sdcard/presets/FullSave7; 
	prefman load_file 8 /sdcard/presets/FullSave8; 
	prefman load_file 9 /sdcard/presets/FullSave9; 
	prefman load_file 10 /sdcard/presets/FullSave10; 
	prefman save; 
	sync;sync;sync;
	/opt/home/scripts/popup_timeout  " [  Loading Complete  ] " 2; st key click pwoff ) || /opt/home/scripts/popup_timeout  " [  Files Missing  ] " 3
exit
