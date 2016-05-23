#!/bin/bash
z_d=$( /opt/home/scripts/popup_entry "Delay Zoom               in milliseconds :" "... and Start" Cancel 0 number)
[[ $z_d =~ ^[0-9]+$ ]] || exit
sleep 3
st key push s1 && st key click s2 && st key release s1
sleep $(($z_d/1000))
st app lens pzoom wide
