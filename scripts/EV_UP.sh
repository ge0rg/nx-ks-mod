#!/bin/bash
renice -n 0 -p $$ 

if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then

[[ -f /sdcard/presets/preset0_up && -f /sdcard/presets/preset1_up ]] && 
$( prefman load_file 0 /sdcard/presets/preset0_up; prefman load_file 1 /sdcard/presets/preset1_up;
prefman save 0;
prefman save 1; 
sync;sync;sync;
/opt/home/scripts/popup_timeout  " [  profile loading...  ] " 2;
reboot ) || /opt/home/scripts/popup_timeout  " [  Preset Missing  ] " 3
exit

elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
	[[ -f /sdcard/presets/preset0_up && -f /sdcard/presets/preset2_up ]] && 
	$( prefman load_file 0 /sdcard/presets/preset0_up; prefman load_file 2 /sdcard/presets/preset2_up;
	prefman save 0;
	prefman save 2; 
	sync;sync;sync;
	/opt/home/scripts/popup_timeout  " [  profile loading...  ] " 2;
	reboot ) || /opt/home/scripts/popup_timeout  " [  Preset Missing  ] " 3
	exit
fi
exit
