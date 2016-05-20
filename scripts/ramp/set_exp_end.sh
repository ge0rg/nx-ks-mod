#!/bin/bash
#
st app mode m
/opt/home/scripts/popup_timeout  "Adjust Exp. Speed and press EV" 2
#
cat /dev/event1 > /tmp/getsp &
end=$((SECONDS+30))
while [ $SECONDS -lt $end ]; do
	if [[ "$(cat /tmp/getsp)" > ""  ]]; then rm /tmp/getsp; 
		break; fi
    sleep 0.25
done
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then
	sp=$(prefman get 0 0xa340  l);
elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40" ]; then
	sp=$(prefman get 0 0x310  l);
fi
#
sp=( $sp ); sp=${sp[5]}; 
#
systemctl set-environment p_4=$sp
/opt/home/scripts/ramp/init.sh
