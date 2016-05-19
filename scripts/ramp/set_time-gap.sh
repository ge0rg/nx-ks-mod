#!/bin/bash
renice -n -50 -p $$
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_2="* ]]; then p_2=${i:4}; fi; done
#
p_2=$(/opt/home/scripts/popup_entry  "Time between images :" "Set Seconds" Cancel $p_2 number)
[[ $p_2 =~ ^[0-9]+$ ]] || mod_gui /opt/home/scripts/gui_ramp
#
systemctl set-environment p_2=$p_2
/opt/home/scripts/ramp/init.sh
