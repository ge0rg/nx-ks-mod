#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "Pro4K="* ]]; then Pro4K=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "ProHD="* ]]; then ProHD=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "Hq4K="* ]]; then Hq4K=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqHD="* ]]; then HqHD=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqVGA="* ]]; then HqVGA=${i:6}; fi; done

sed -e "s/\${Pro4K}/"$Pro4K"/" -e "s/\${ProHD}/"$ProHD"/"  -e "s/\${Hq4K}/"$Hq4K"/" -e "s/\${HqHD}/"$HqHD"/" -e "s/\${HqVGA}/"$HqVGA"/" /opt/home/scripts/init_auto.tp >  /opt/home/scripts/auto/init.sh
sync;sync;sync
/opt/home/scripts/popup_timeout  " [ Bitrates Updated  ] " 2
killall mod_gui
