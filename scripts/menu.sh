#!/bin/bash
if ! killall -q mod_gui 
  then
	 nice -n +15 /opt/usr/nx-ks/mod_gui /opt/usr/nx-ks/gui_ini & nice -n +19 /opt/usr/nx-ks/br_menu.sh &
fi 
killall -q popup_entry & killall -q popup_ok &  killall -q focus_stack & killall -q focus_buttons & killall -q onscreen_ov &  killall -q onscreen_235 &
