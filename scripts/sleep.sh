#!/bin/bash
die() { exit; }
ticking() {
	end=$((SECONDS+$1))
	while [ $SECONDS -lt $end ]; do
		if [[ "$(cat /tmp/asleep)" >""  ]]; then rm /tmp/asleep; 
			st app nx capture af-mode single &
			# st pmu set lli on
			# st pmu set ipc_lcac on
			# st pmu set ipc_bnr on
			/opt/usr/nx-ks/auto/performance.sh
			#st cap lens power on 
			die
		fi
	    sleep 0.5
	done
}
[ -d "/sdcard/presets" ] || mkdir /sdcard/presets
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.12$ /etc/version.info) = "1.12" ]; then
	prefman set 0 0x0000a690 b 0
elif [  $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41" ]; then
	prefman set 0 0x00000658 b 0
fi
st app nx capture af-mode manual
dm=$(st cap capdtm getusr DIALMODE);  dm=( $dm )
dm=${dm[2]}
case "$dm" in
"DIALMODE_SMARTAUTO") st app mode auto &
    ;;
"DIALMODE_APERTURE") st app mode a  &
    ;;
"DIALMODE_SHUTTERSPEED") st app mode s  &
  ;;
"DIALMODE_MANUAL") st app mode m   &
   ;;
"DIALMODE_SMARTPRO") st app mode smart-pro &
   ;;
*) 
st app mode p &
;;
esac
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
sleep 0.75
st app bb lcd off
# st pmu set lli off
# st pmu set ipc_lcac off
# st pmu set ipc_bnr off
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /sdcard/presets/hib
cat /dev/event0 > /tmp/asleep &
cat /dev/event1 >> /tmp/asleep &
#################################
ticking 720
rm /tmp/asleep
st cap lens power off
st app nx capture af-mode single
# st pmu set lli on
# st pmu set ipc_lcac on
# st pmu set ipc_bnr on
sync
sync
sync
sleep 0.5
systemctl hybrid-sleep
