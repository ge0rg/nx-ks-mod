#!/bin/bash
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.12$ /etc/version.info) = "1.12" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41"  ]; then
#
	t1=($(cksum /sdcard/presets/preset0_up1)) ; t2=($(cksum /sdcard/presets/preset0_up2)) ; 
	[[ $t1 = $t2  ]] && 
	$(  /opt/usr/nx-ks/popup_timeout  " [  profile loading...  ] " 1 \&
	prefman load_file 0 /sdcard/presets/preset0_up1
	sync;sync;sync;
	dm=$(st cap capdtm getusr DIALMODE);  dm=( $dm )
	dm=${dm[2]}
	case "$dm" in
	"DIALMODE_SMARTAUTO") st app mode auto 
	    ;;
	"DIALMODE_APERTURE") st app mode a
	    ;;
	"DIALMODE_SHUTTERSPEED") st app mode s 
	  ;;
	"DIALMODE_MANUAL") st app mode m  
	   ;;
	"DIALMODE_SMARTPRO") st app mode smart-pro
	   ;;
	*) 
	st app mode p
	;;
	esac ) || /opt/usr/nx-ks/popup_timeout  " [  Preset Missing  ] " 3
fi

