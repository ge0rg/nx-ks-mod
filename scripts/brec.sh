#!/bin/bash
renice -n 0 -p $$
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
recording_length=890
for i in "${tii[@]}"; do if [[ $i == "rbl="* ]]; then recording_length=${i:4}; fi; done
#
for i in "${tii[@]}"; do if [[ $i == "rec="* ]]; then rec=$((1-${i:4})); fi; done
if [[ -z "$rec" ]]; then rec=1; fi

/opt/home/scripts/popup_ok "CONT. REC - $recording_length sec batch ?" START CANCEL 
if [[  $? -eq 255 ]]; then  
	systemctl set-environment rec=0;  
	die 
fi
systemctl set-environment rec=$rec
until [ $rec -lt 1 ]
do
      st key click rec;ticking $recording_length;st key click rec
      tii=($(systemctl show-environment))
      for i in "${tii[@]}"; do if [[ $i == "rec="* ]]; then rec=${i:4}; fi; done
done
exit
