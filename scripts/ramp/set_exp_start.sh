#!/bin/bash
#
st app mode m
/opt/usr/nx-ks/popup_timeout  "Adjust Exp. Speed and press EV" 2
#
cat /dev/event1 > /tmp/getsp &
end=$((SECONDS+30))
while [ $SECONDS -lt $end ]; do
	if [[ "$(cat /tmp/getsp)" > ""  ]]; then rm /tmp/getsp; break; fi
	sleep 0.25
done
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.12$ /etc/version.info) = "1.12" ]; then
	sp=$(prefman get 0 0xa340  l);
elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41" ]; then
	sp=$(prefman get 0 0x310  l);
fi
#
sp=( $sp ); sp=${sp[5]}; 
#
[[ $sp -gt "20000" ]] && sp=$(($sp-65536))
systemctl set-environment p_3=$sp
/opt/usr/nx-ks/loader.sh "/opt/usr/nx-ks/ramp/init.sh"
