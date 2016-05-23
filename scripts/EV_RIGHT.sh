#!/bin/bash
[[  "$(/opt/home/scripts/poker2 /sys/devices/platform/d5keys-polled/keymask 0x0)" == "0x00000000:307830303030303030300a0000000000" ]] && 
( 
 	/opt/home/scripts/popup_timeout  " [ TBBAF - ON  ] " 1 &
 	/opt/home/scripts/poker2 /sys/devices/platform/d5keys-polled/keymask 0x0:307830303030303830300a ;
) || 
( 
 	/opt/home/scripts/popup_timeout  " [ TBBAF - OFF  ] " 1 &
 	/opt/home/scripts/poker2 /sys/devices/platform/d5keys-polled/keymask 0x0:307830303030303030300a ;
)
exit
