#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_7="* ]]; then p_7=${i:4}; fi; done
#
p_7=$(/opt/home/scripts/popup_entry "Time-lapse duration:" "Set Minutes" Cancel $p_7 number )
[[ $p_7 =~ ^[0-9]+$ ]] || mod_gui /opt/home/scripts/gui_ramp
#
systemctl set-environment p_7=$p_7
/opt/home/scripts/loader.sh "/opt/home/scripts/ramp/init.sh"
