#!/bin/bash
renice -n -50 -p $$
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_5="* ]]; then p_5=${i:4}; fi; done
#
p_5=$(/opt/home/scripts/popup_entry  "Ramp duration:" "Set Minutes" Cancel 1 number)
[[ $p_5 =~ ^[0-9]+$ ]] || mod_gui /opt/home/scripts/gui_ramp
#
systemctl set-environment p_5=$p_5
/opt/home/scripts/ramp/init.sh

