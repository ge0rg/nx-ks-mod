#!/bin/bash
z_d=$( /opt/usr/nx-ks/popup_entry "Shutter Time in seconds :" "Capture" "Cancel" "" number)
[[ $z_d =~ ^[0-9]+$ ]] || exit
/opt/usr/nx-ks/popup_timeout "${z_d}s bulb shutter in 2s..." 2

/opt/usr/nx-ks/bulb.sh $z_d
