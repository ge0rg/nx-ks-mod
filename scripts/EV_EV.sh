#!/bin/bash
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $(st app bb lcd on; st app disp lcd) &&  sleep 1 ; } & killall -q mod_gui 
nice -n -15 /opt/usr/nx-ks/loadgui.sh&
killall -q popup_entry & killall -q popup_ok &  killall -q focus_stack & killall -q focus_buttons & killall -q onscreen_ov &  killall -q onscreen_235 &
