#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_6="* ]]; then p_6=${i:4}; fi; done
#
p_6=$(/opt/usr/nx-ks/popup_entry  "Ramp duration:" "Set Minutes" Cancel $p_6 number)
[[ $p_6 =~ ^[0-9]+$ ]] || mod_gui /opt/usr/nx-ks/gui_ramp
#
systemctl set-environment p_6=$p_6
/opt/usr/nx-ks/loader.sh "/opt/usr/nx-ks/ramp/init.sh"

