#!/bin/bash
sync;sync;sync
echo 3 > /proc/sys/vm/drop_caches
renice -n -10 -p $$
renice -n +10 -p $(pgrep di-camera-app)
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "pos="* ]]; then pos_mv=$((${i:4} - $pos_temp)); fi; done
for i in "${tii[@]}"; do if [[ $i == "fps="* ]]; then fp_speed=${i:4}; fi; done
[[ $fp_speed =~ ^[0-9]+$ ]] || fp_speed=4
systemctl set-environment pos=$pos_temp
st cap iq af mv 10 $pos_mv $fp_speed
exit
