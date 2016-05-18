#!/bin/bash
renice -n -50 -p $$
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /opt/home/scripts/popup_timeout  " [ Mod v1.75m ] " 2 &
#############################################
# Choose Bitrates ( no added spaces! make sure it looks like Pro4K=90 )
#       Available bitrates in Mbps: 35,40,45,50,55,60,65,70,75,80,85,90,95,
#       100,110,120,130,140,150,160,170,180,190,
#       200,210,220,230,240,250,260,270,280,290,300,310,320
#############################################
Pro4K=180   #nx500-pro1         / nx1-pro1
ProHD=180   #nx500-pro2&pro3    / nx1-pro2
Hq4K=90    #nx500-hq1          / nx1-hq1&hq2
HqHD=90     #nx500-hq2&hq3&hq4  / nx1-hq3
HqVGA=160   #nx500-hq5&hq6
#############################################
/opt/home/scripts/pokemon pro1 $Pro4K
/opt/home/scripts/pokemon pro2 $ProHD
/opt/home/scripts/pokemon pro3 $ProHD
/opt/home/scripts/pokemon hq1 $Hq4K
/opt/home/scripts/pokemon hq2 $HqHD
/opt/home/scripts/pokemon hq3 $HqHD
/opt/home/scripts/pokemon hq4 $HqHD
/opt/home/scripts/pokemon hq5 $HqVGA
/opt/home/scripts/pokemon hq6 $HqVGA
#############################################
systemctl set-environment Pro4K=$Pro4K
systemctl set-environment ProHD=$ProHD
systemctl set-environment Hq4K=$Hq4K
systemctl set-environment HqHD=$HqHD
systemctl set-environment HqVGA=$HqVGA
##############################################
systemctl set-environment fps=4
sysctl fs.file-max=30000
sync
sync
sync
exit
