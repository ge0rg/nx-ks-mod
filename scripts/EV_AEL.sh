#!/bin/bash
renice -n +17 -p $$
yell() { echo "$0: $*" >&2; }
die() { [ $blackout ] && $( killall -q blackout;  sleep 2; nice -n +15 /opt/usr/nx-ks/onscreen_ks&) &
		yell "$*"; exit 111; }
ticking() {
	end=$((SECONDS+$1))
	while [ $SECONDS -lt $end ]; do
		hevc=($(st pmu show | grep hevc)); if [[ "${hevc[1]}" == "OFF" ]]; then systemctl set-environment rec=0; die; fi
	    sleep 0.5
	done
}
blackoutprep(){
	killall -q onscreen_ks
	/opt/usr/nx-ks/blackout&
}
blackouton(){
	sleep 2
	st app led off
}
touchoff(){
	if [ "$MODEL" = "NX500" ]; then
		prefman set 0 0x0000a690 b 0
	elif [  "$MODEL" = "NX1" ]; then
		prefman set 0 0x00000658 b 0
	fi
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
}

tii=($(systemctl show-environment))
#
recording_length=10
#
blackout="on";  
systemctl set-environment blackout="on";
touch="off";  
#
systemctl set-environment rec=$rec
recording_length=$(($recording_length*60-1))
[ "$MODEL" = "NX1" ] && camisnx1="nx1"
touchoff
blackoutprep&
until [ $rec -lt 1 ]
do
      /opt/usr/nx-ks/stapp "app nx record start" 
      blackouton
      ticking $recording_length
      tii=($(systemctl show-environment))
      for i in "${tii[@]}"; do if [[ $i == "rec="* ]]; then rec=${i:4}; fi; done
      /opt/usr/nx-ks/stapp "app nx record stop"
      [ $camisnx1 ]  && sleep 2
done
