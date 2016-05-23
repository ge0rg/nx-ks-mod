#!/bin/bash
hevc=($(st pmu show | grep hevc)); 
if [[ "${hevc[1]}" == "ON" ]]; then 
	/opt/home/scripts/popup_timeout  "Video Mode !?" 3
	/opt/home/scripts/popup_timeout  "Are you asking for trouble?" 2
	/opt/home/scripts/popup_timeout  "Trouble comes in: 3, 2,... 1" 2
	killall mod_gui
	exit
fi
#
tl_d=$(/opt/home/scripts/popup_entry "Time-lapse duration:" "Set Minutes" Cancel 30 number )
[[ $tl_d =~ ^[0-9]+$ ]] || exit
tl_d=$(($tl_d*60))
#
tl_g=$(/opt/home/scripts/popup_entry  "Time between images :" "Set Seconds" Cancel 5 number)
[[ $tl_g =~ ^[0-9]+$ ]] || exit
#
sleepytime=$(/opt/home/scripts/popup_entry "Start Time in :" "Set Minutes and START" Cancel 0 number )
[[ $sleepytime =~ ^[0-9]+$ ]] || exit
#
sed -e "s/\${tl_d}/"$tl_d"/" -e "s/\${tl_g}/"$tl_g"/"   /opt/home/scripts/timelapse.tp >  /opt/home/scripts/auto/tl.sh
chmod +x /opt/home/scripts/auto/tl.sh
#
sleepytime=$(($sleepytime*60))
#
/usr/bin/st app nx capture af-mode manual
/usr/bin/st cap capdtm setusr AFMODE 0x70003
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /sdcard/presets/hib
sync; sync; sync;
sleep 0.25
#
[[ $sleepytime > "0" ]] && $(  /opt/home/scripts/popup_timeout  "Wakeup in $(($sleepytime/60))min. Zzzz." 3 && rtcwake -m mem -s $sleepytime && reboot ) || /opt/home/scripts/auto/tl.sh
