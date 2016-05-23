#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "fps="* ]]; then fps=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "swmo="* ]]; then s=${i:5}; fi; done
sed -e "s/\${fps}/"$fps"/" -e "s/\${s}/"$s"/"  /opt/home/scripts/init_auto.tp >  /opt/home/scripts/auto/a_init.sh
sync;sync;sync
exit
