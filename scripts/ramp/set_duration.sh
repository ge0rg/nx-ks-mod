#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_1="* ]]; then p_1=${i:4}; fi; done
#
p_1=$(/opt/usr/nx-ks/popup_entry "Time-lapse duration:" "Set Minutes" Cancel $p_1 number )
[[ $p_1 =~ ^[0-9]+$ ]] || exit
#
systemctl set-environment p_1=$p_1
/opt/usr/nx-ks/loader.sh "/opt/usr/nx-ks/ramp/init.sh"
