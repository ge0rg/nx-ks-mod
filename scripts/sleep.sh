#!/bin/bash
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
ticking() {
	end=$((SECONDS+$1))
	while [ $SECONDS -lt $end ]; do
		if [[ "$(cat /sdcard/presets/asleep)" >""  ]]; then rm /sdcard/presets/asleep; 
			st pmu set lli on
			st pmu set ipc_lcac on
			st pmu set ipc_bnr on
			die; fi
	    sleep 0.5
	done
}
[ -d "/mnt/mmc/presets" ] || mkdir /mnt/mmc/presets

st app bb lcd off
st pmu set lli off
st pmu set ipc_lcac off
st pmu set ipc_bnr off

af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /mnt/mmc/presets/hib
cat /dev/event0 > /sdcard/presets/asleep &
cat /dev/event1 >> /sdcard/presets/asleep &
ticking 180
rm /sdcard/presets/asleep
st pmu set lli on
st pmu set ipc_lcac on
st pmu set ipc_bnr on
sync
sync
sync
sleep 0.5
systemctl hybrid-sleep

