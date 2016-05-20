#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "fps="* ]]; then cfps=${i:4}; fi; done
fps=$(/opt/home/scripts/popup_entry "Set Focus-Pull Speed [ 0 ~ 255 ]:" "Set Speed" Cancel $cfps number )
[[ $fps =~ ^[0-9]+$ ]] || fps=4
systemctl set-environment fps=$fps
sync;sync;sync
/opt/home/scripts/br_up.sh