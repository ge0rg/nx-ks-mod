#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "Pro4K="* ]]; then Pro4K=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "ProHD="* ]]; then ProHD=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "Hq4K="* ]]; then Hq4K=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqHD="* ]]; then HqHD=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqVGA="* ]]; then HqVGA=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "fps="* ]]; then fps=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "swmo="* ]]; then s=${i:5}; fi; done
sed -e "s/\${Pro4K}/"$Pro4K"/" -e "s/\${ProHD}/"$ProHD"/"  -e "s/\${Hq4K}/"$Hq4K"/" -e "s/\${HqHD}/"$HqHD"/" -e "s/\${HqVGA}/"$HqVGA"/" -e "s/\${fps}/"$fps"/" -e "s/\${s}/"$s\ "/"  /opt/home/scripts/init_auto.tp >  /opt/home/scripts/auto/a_init.sh
sync;sync;sync
exit
