#!/bin/bash
renice -n -50 -p $$
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_6="* ]]; then p_6=${i:4}; fi; done
#
p_6=$(/opt/home/scripts/popup_entry  "Ramps starts after :" "Set Minutes" Cancel $p_6 number)
[[ $p_6 =~ ^[0-9]+$ ]] || mod_gui /opt/home/scripts/gui_ramp
#
systemctl set-environment p_6=$p_6
/opt/home/scripts/ramp/init.sh
