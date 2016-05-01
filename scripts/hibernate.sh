#!/bin/bash
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /mnt/mmc/presets/hib
sync
sync
sync
sleep 0.25
systemctl hybrid-sleep
