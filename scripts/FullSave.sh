#!/bin/bash
 /opt/usr/nx-ks/popup_timeout  " [  Saving...  ] " 2 &
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
prefman save_file 0 /sdcard/presets/FullSave0
prefman save_file 1 /sdcard/presets/FullSave1
prefman save_file 2 /sdcard/presets/FullSave2
prefman save_file 3 /sdcard/presets/FullSave3
prefman save_file 4 /sdcard/presets/FullSave4
prefman save_file 5 /sdcard/presets/FullSave5
prefman save_file 6 /sdcard/presets/FullSave6
prefman save_file 7 /sdcard/presets/FullSave7
prefman save_file 8 /sdcard/presets/FullSave8
prefman save_file 9 /sdcard/presets/FullSave9
prefman save_file 10 /sdcard/presets/FullSave10
sync
sync
sync
/opt/usr/nx-ks/popup_timeout  " [ Saving Complete ] " 3
exit
