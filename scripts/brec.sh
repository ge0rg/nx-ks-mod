#!/bin/bash
renice -n -50 -p $$
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
ticking() {
	end=$((SECONDS+$1))
	while [ $SECONDS -lt $end ]; do
		hevc=($(st pmu show | grep hevc)); if [[ "${hevc[1]}" == "OFF" ]]; then systemctl set-environment rec=0; die; fi
	    sleep 0.5
	done
}
tii=($(systemctl show-environment))
#
recording_length=$(/opt/home/scripts/popup_entry  "Video length :" "Set Minutes" Cancel 14 number)
[[ $recording_length =~ ^[0-9]+$ ]] || recording_length=14
#
for i in "${tii[@]}"; do if [[ $i == "rec="* ]]; then rec=$((1-${i:4})); fi; done
if [[ -z "$rec" ]]; then rec=1; fi
/opt/home/scripts/popup_ok "CONT. REC - $recording_length Minutes Batch ?" START CANCEL 
if [[  $? -eq 255 ]]; then  
	systemctl set-environment rec=0;  
	die 
fi
systemctl set-environment rec=$rec
recording_length=$(($recording_length*60-1))
until [ $rec -lt 1 ]
do
      st key click rec;sleep 2;ticking $recording_length;st key click rec
      tii=($(systemctl show-environment))
      for i in "${tii[@]}"; do if [[ $i == "rec="* ]]; then rec=${i:4}; fi; done
done
exit
