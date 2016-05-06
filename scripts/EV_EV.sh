#!/bin/bash
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $(st app disp lcd) &&  sleep 1 ; }
renice -n -15 -p $$
killall -q mod_gui
/opt/home/scripts/mod_gui /opt/home/scripts/gui_ini &
/opt/home/scripts/br_menu.sh
exit
