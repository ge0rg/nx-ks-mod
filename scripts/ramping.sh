#!/bin/bash
renice -n -50 -p $$
getspeed() { 
		if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then
			sp=$(prefman get 0 0xa340  b);
		elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40" ]; then
			sp=$(prefman get 0 0x310  b);
		fi
		sp=( $sp ); sp=${sp[5]}; 
 }
#
tl_d=$(/opt/home/scripts/popup_entry "Time-lapse duration:" "Set Minutes" Cancel 10 number )
[[ $tl_d =~ ^[0-9]+$ ]] || exit
tl_d=$(($tl_d*60))
#
tl_g=$(/opt/home/scripts/popup_entry  "Time between images :" "Set Seconds" Cancel 5 number)
[[ $tl_g =~ ^[0-9]+$ ]] || exit
#
#exp_s=$(/opt/home/scripts/popup_entry  "Exp Speed at START   1 / X :" "Set Speed" Cancel "15" )
/opt/home/scripts/popup_ok  "Exposure Speed at START" "Adjust settings and :" "SET SPEED"
getspeed()
exp_s = $sp;
#
/opt/home/scripts/popup_ok  "Exposure Speed at END" "Adjust settings and :" "SET SPEED"
getspeed()
exp_e = $sp;
#
rmp_s=$(/opt/home/scripts/popup_entry  "Ramps starts after :" "Set Minutes" Cancel $((tl_d/2)) number)
[[ $rmp_s =~ ^[0-9]+$ ]] || exit
rmp_s=$(($rmp_s*60))
#
rmp_d=$(/opt/home/scripts/popup_entry  "Ramp duration:" "Set Minutes" Cancel 1 number)
[[ $rmp_d =~ ^[0-9]+$ ]] || exit
rmp_d=$(($rmp_d*60))
#
sleepytime=$(/opt/home/scripts/popup_entry "Delay Start           sleep for :" "Set Minutes and START" Cancel 10 number )
[[ $sleepytime =~ ^[0-9]+$ ]] || exit
#
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
[[ $sleepytime > "0" ]] && ( rtcwake -m mem -s $sleepytime && reboot ) || /opt/home/scripts/auto/tl.sh

/opt/home/scripts/popup_timeout  "Exposure Speed at ENDExposure Speed at ENDExposure Speed at ENDExposure Speed at END" 5