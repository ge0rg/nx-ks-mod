#!/bin/bash
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $(st app disp lcd) &&  sleep 1 ; }
renice -n -50 -p $$
killall -q mod_gui
killall -q popup_entry
killall -q focus_stack
/opt/home/scripts/mod_gui /opt/home/scripts/gui_ini &
/opt/home/scripts/br_menu.sh
exit
