#!/bin/bash
br=$(/mnt/mmc/scripts/popup_entry "Change Bitrate for $1" "Apply Change" Cancel)

[[  "$br" == "" ]] && exit
 
 #check if selected br is available
avail_br=(35 40 45 50 55 60 65 70 75 80 85 90 95 100 110 120 130 140 150 160 170 180 190 200 210 220 230 240 250 260 270 280 290 300 310 320)
[[ "${avail_br[@]}" =~ "${br}" ]] ||  { $(/mnt/mmc/scripts/popup_timeout  " [  Value Not Available  ] " 3) &&  exit ; }


case "$1" in
4K-ProQ)  /mnt/mmc/scripts/pokemon pro1 $br; systemctl set-environment Pro4K=$br
    ;;
HD-ProQ) /mnt/mmc/scripts/pokemon pro2 $br; /mnt/mmc/scripts/pokemon pro3 $br; systemctl set-environment ProHD=$br
    ;;
4K-HQ)  /mnt/mmc/scripts/pokemon hq1 $br; systemctl set-environment Hq4K=$br
    ;;
HD-HQ) /mnt/mmc/scripts/pokemon hq2 $br; /mnt/mmc/scripts/pokemon hq3 $br; /mnt/mmc/scripts/pokemon hq4 $br; systemctl set-environment HqHD=$br
   ;;
VGA-HQ) /mnt/mmc/scripts/pokemon hq5 $br; /mnt/mmc/scripts/pokemon hq6 $br; systemctl set-environment HqVGA=$br
   ;;
*)
;;
esac


 sync;sync;sync
 /sdcard/scripts/br_up.sh

