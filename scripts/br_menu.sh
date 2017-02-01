#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "Pro4K="* ]]; then Pro4K=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "ProHD="* ]]; then ProHD=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "Hq4K="* ]]; then Hq4K=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqHD="* ]]; then HqHD=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqVGA="* ]]; then HqVGA=${i:6}; fi; done
cb=$(/opt/usr/nx-ks/gbr)
[[ $cb > "" ]] && cb=$cb"Mbps" || cb="NotSupported"
sed -e "s/\${Pro4K}/"$Pro4K"/" -e "s/\${ProHD}/"$ProHD"/"  -e "s/\${Hq4K}/"$Hq4K"/" -e "s/\${HqHD}/"$HqHD"/" -e "s/\${HqVGA}/"$HqVGA"/"  -e "s/\${cb}/"$cb"/" /opt/usr/nx-ks/gui_br.tp >  /tmp/gui_br.NX500
sed -e "s/\${Pro4K}/"$Pro4K"/" -e "s/\${ProHD}/"$ProHD"/"  -e "s/\${Hq4K}/"$Hq4K"/" -e "s/\${HqHD}/"$HqHD"/" -e "s/\${HqVGA}/"$HqVGA"/"  -e "s/\${cb}/"$cb"/" /opt/usr/nx-ks/gui_br_NX1.tp >  /tmp/gui_br.NX1
sync;sync;sync
########################################################################################
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
##############################################
sed -e "s/\${p_1}/"$p_1"/" -e "s/\${p_2}/"$p_2"/" -e "s/\${p_3}/"$p_3"/" -e "s/\${p_4}/"$p_4"/" -e "s/\${p_5}/"$p_5"/" -e "s/\${p_6}/"$p_6"/" -e "s/\${p_7}/"$p_7"/"  -e "s/\${p}/"500"/" /opt/usr/nx-ks/gui_ramp_ov.tp > /tmp/gui_ramp.NX500
sed -e "s/\${p_1}/"$p_1"/" -e "s/\${p_2}/"$p_2"/" -e "s/\${p_3}/"$p_3"/" -e "s/\${p_4}/"$p_4"/" -e "s/\${p_5}/"$p_5"/" -e "s/\${p_6}/"$p_6"/" -e "s/\${p_7}/"$p_7"/"  -e "s/\${p}/"1"/" /opt/usr/nx-ks/gui_ramp_ov.tp > /tmp/gui_ramp.NX1
##############################################
sync;sync;sync
exit
