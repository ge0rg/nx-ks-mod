#!/bin/bash
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /sdcard/presets/hib
st cap lens power off
sync
sync
sync
sleep 0.25
systemctl hybrid-sleep
