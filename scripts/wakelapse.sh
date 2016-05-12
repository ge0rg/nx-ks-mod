#!/bin/bash
renice -n -50 -p $$
sleepytime=$(/opt/home/scripts/popup_entry "Start Time in:" "Set Minutes" Cancel)
[[ $sleepytime =~ ^[0-9]+$ ]] || exit
#
tl_g=$(/opt/home/scripts/popup_entry "Time-gap in Seconds:" "Set Seconds" "Default: 5sec")
[[ $tl_g =~ ^[0-9]+$ ]] || tl_g=5
#
tl_d=$(/opt/home/scripts/popup_entry "Duration in Minutes:" "Set Minutes" "Default: 10m")
[[ $tl_d =~ ^[0-9]+$ ]] || tl_d=10
tl_d=$(($tl_d*60))
#
sed -e "s/\${tl_d}/"$tl_d"/" -e "s/\${tl_g}/"$tl_g"/"   /opt/home/scripts/timelapse.tp >  /opt/home/scripts/auto/tl.sh
chmod +x /opt/home/scripts/auto/tl.sh
#
sleepytime=$(($sleepytime*60))
rtcwake -m mem -s $sleepytime && reboot
