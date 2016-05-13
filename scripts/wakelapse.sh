#!/bin/bash
renice -n -50 -p $$
killall -q keyscan
sleepytime=$(/opt/home/scripts/popup_entry "Start Time in :" "Set Minutes" Cancel 10 number )
[[ $sleepytime =~ ^[0-9]+$ ]] || exit
#
tl_g=$(/opt/home/scripts/popup_entry  "Time between images :" "Set Seconds" Cancel 5 number)
[[ $tl_g =~ ^[0-9]+$ ]] || exit
#
tl_d=$(/opt/home/scripts/popup_entry "Time-lapse duration:" "Set Minutes" Cancel 10 number )
[[ $tl_d =~ ^[0-9]+$ ]] || exit
tl_d=$(($tl_d*60))
#
sed -e "s/\${tl_d}/"$tl_d"/" -e "s/\${tl_g}/"$tl_g"/"   /opt/home/scripts/timelapse.tp >  /opt/home/scripts/auto/tl.sh
chmod +x /opt/home/scripts/auto/tl.sh
#
sleepytime=$(($sleepytime*60))
#
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /sdcard/presets/hib
sync; sync; sync;
sleep 0.25
#
rtcwake -m mem -s $sleepytime && reboot
