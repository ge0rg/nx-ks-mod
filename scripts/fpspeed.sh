#!/bin/bash
renice -n -50 -p $$
fps=$(/opt/home/scripts/popup_entry "Set Focus-Pull Speed [0~255]:" "Set Speed" "Default: 4")
[[ $fps =~ ^[0-9]+$ ]] || fps=4
systemctl set-environment fps=$fps
sync;sync;sync
/opt/home/scripts/br_up.sh