#!/bin/bash
renice -n 0 -p $$
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "pos="* ]]; then pos_mv=$((${i:4} - $pos_temp)); fi; done
systemctl set-environment pos=$pos_temp
st cap iq af mv 10 $pos_mv 10
exit
