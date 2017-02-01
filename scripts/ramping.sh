#!/bin/bash
#############################################
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "p_1="* ]]; then p_1=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "p_2="* ]]; then p_2=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "p_3="* ]]; then p_3=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "p_4="* ]]; then p_4=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "p_5="* ]]; then p_5=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "p_6="* ]]; then p_6=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "p_7="* ]]; then p_7=${i:4}; fi; done
#############################################
[[ $p_1 = "" ]] &&  systemctl set-environment p_1=90 &&  p_1=90 
[[ $p_2 = "" ]] &&  systemctl set-environment p_2=10 &&  p_2=10 
[[ $p_3 = "" ]] &&  systemctl set-environment p_3=75 &&  p_3=15 
[[ $p_4 = "" ]] &&  systemctl set-environment p_4=150 && p_4=150
[[ $p_5 = "" ]] &&  systemctl set-environment p_5=30 &&  p_5=30 
[[ $p_6 = "" ]] &&  systemctl set-environment p_6=10 &&  p_6=10 
[[ $p_7 = "" ]] &&  systemctl set-environment p_7=0 && p_7=0
#############################################
p_1=$(($p_1*60))
p_5=$(($p_5*60))
p_6=$(($p_6*60))
sleepytime=$(($p_7*60))
#############################################
sed -e "s/\${p_1}/"$p_1"/" -e "s/\${p_2}/"$p_2"/" -e "s/\${p_3}/"$p_3"/" -e "s/\${p_4}/"$p_4"/" -e "s/\${p_5}/"$p_5"/" -e "s/\${p_6}/"$p_6"/"  -e "s/\${p_7}/"$p_7"/"  /opt/usr/nx-ks/ramplapse.tp >  /opt/usr/nx-ks/auto/tl.sh
chmod +x /opt/usr/nx-ks/auto/tl.sh
#
/usr/bin/st app nx capture af-mode manual
/usr/bin/st cap capdtm setusr AFMODE 0x70003
af_info=($(st cap iq af pos))
pos_temp=${af_info[2]} 
echo $pos_temp > /sdcard/presets/hib
sync; sync; sync;
echo 3 > /proc/sys/vm/drop_caches
sleep 0.25
#
[[ $sleepytime > "0" ]] && $( /opt/usr/nx-ks/popup_timeout  "Wakeup in $(($sleepytime/60))min. Zzzz." 3 && rtcwake -m mem -s $sleepytime && reboot ) || /opt/usr/nx-ks/auto/tl.sh

