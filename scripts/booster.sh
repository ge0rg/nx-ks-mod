#!/bin/bash
renice -n -50 -p $$
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
ticking() {
	end=$((SECONDS+$1))
	while [ $SECONDS -lt $end ]; do
		if [[ "$(cat /sdcard/presets/asleep)" >""  ]]; then rm /sdcard/presets/asleep; 
			hevc=($(st pmu show | grep hevc)); if [[ "${hevc[1]}" == "ON" ]]; then st key click rec; sleep 1; fi
 			st key click rec
			die; fi
	    sleep 0.5
	done
}
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
killall -q mod_gui
sleep 1 
st key click rec
sleep 1
renice -n -50 -p $(pgrep di-camera-app)
cat /dev/event0 > /sdcard/presets/asleep &
cat /dev/event1 >> /sdcard/presets/asleep &
ticking 99999
exit
