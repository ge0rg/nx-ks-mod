#!/bin/bash
renice -n -10 -p $$
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /opt/home/scripts/popup_timeout  " [ Mod v2.07 by Otto / KS ] " 3 &
systemctl set-environment fps=4
sysctl fs.file-max=30000
