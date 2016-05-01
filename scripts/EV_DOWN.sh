#!/bin/bash
renice -n 0 -p $$

if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then

[[ -f /mnt/mmc/presets/preset0_down && -f /mnt/mmc/presets/preset1_down ]] &&
$( prefman load_file 0 /mnt/mmc/presets/preset0_down; prefman load_file 1 /mnt/mmc/presets/preset1_down;
prefman save 0;
prefman save 1;
sync;sync;sync;
/mnt/mmc/scripts/popup_timeout  " [  profile loading...  ] " 2;
reboot ) || /mnt/mmc/scripts/popup_timeout  " [  Preset Missing  ] " 3
exit

elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
	[[ -f /mnt/mmc/presets/preset0_down && -f /mnt/mmc/presets/preset2_down ]] &&
	$( prefman load_file 0 /mnt/mmc/presets/preset0_down; prefman load_file 2 /mnt/mmc/presets/preset2_down;
	prefman save 0;
	prefman save 2;
	sync;sync;sync;
	/mnt/mmc/scripts/popup_timeout  " [  profile loading...  ] " 2;
	reboot ) || /mnt/mmc/scripts/popup_timeout  " [  Preset Missing  ] " 3
	exit
fi
