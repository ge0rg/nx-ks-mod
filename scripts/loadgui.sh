#!/bin/bash
#renice -n -15 -p $$  &> /dev/null &
if [ "$MODEL" = "NX500" ]; then
	to=$(prefman get 0 0x0000a690  b);  to=( $to )
	to=${to[5]}
	[[ "$to" = "0" ]] &&  prefman set 0 0x0000a690 b 1
elif [  "$MODEL" = "NX1" ]; then
	to=$(prefman get 0 0x00000658  b);  to=( $to )
	to=${to[5]}
	[[ "$to" = "0" ]] && prefman set 0 0x00000658 b 1

fi
#
if [[  "$to" = "0"  ]]; then
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
	esac 
fi
#
nice -n +15 /opt/usr/nx-ks/mod_gui /opt/usr/nx-ks/gui_ini & nice -n +19 /opt/usr/nx-ks/br_menu.sh &
