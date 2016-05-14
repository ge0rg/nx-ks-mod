#!/bin/bash
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
#
	t1=($(cksum /sdcard/presets/preset0_up1)) ; t2=($(cksum /sdcard/presets/preset0_up2)) ; 
	[[ $t1 = $t2  ]] && 
	$( prefman load_file 0 /sdcard/presets/preset0_up1;
	prefman save 0;
	sync;sync;sync;
	/opt/home/scripts/popup_timeout  " [  profile loading...  ] " 2;
	sync;sync;sync;
	st key click pwoff ) || /opt/home/scripts/popup_timeout  " [  Preset Missing  ] " 3
fi
exit
