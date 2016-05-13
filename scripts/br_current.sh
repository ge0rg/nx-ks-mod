#!/bin/bash
renice -n -50 -p $$ > /dev/null
avail_br=(35 40 45 50 55 60 65 70 75 80 85 90 95 100 110 120 130 140 150 160 170 180 190 200 210 220 230 240 250 260 270 280 290 300 310 320)
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ]; then
#NX500
mq=$(prefman get 0 0x0000a368  b);  mq=( $mq )
mq=${mq[5]}
cb=$( /opt/home/scripts/gbr )
[[  "$cb" == "" ]] && /opt/home/scripts/popup_timeout  " [  Profile Not Adjustable  ] " 2 && exit
br=$(/opt/home/scripts/popup_entry "Current Bitrate ( Mbps ) :" "Apply Change" Cancel $cb number )
[[ "$br" == "" ]]  && exit
[[ "${avail_br[@]}" =~ "${br}" ]] ||  { $(/opt/home/scripts/popup_timeout  " [  Value Not Available  ] " 3) &&  exit ; }
mz=$(prefman get 0 0x0000a360  b);  mz=( $mz )
mz=${mz[5]}
case "$mz" in
0)  [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&  /opt/home/scripts/pokemon hq1 $br 
    ;;
1)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&   /opt/home/scripts/pokemon hq1 $br 
    ;;
2)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro2 $br 
[[  "$mq" == "1" ]] &&   /opt/home/scripts/pokemon hq2 $br 
  ;;
3)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro3 $br 
[[  "$mq" == "1" ]] &&   /opt/home/scripts/pokemon hq3 $br 
   ;;
4)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro3 $br 
[[  "$mq" == "1" ]] &&    /opt/home/scripts/pokemon hq3 $br
   ;;
6)  [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon hq4 $br
[[  "$mq" == "1" ]] && /opt/home/scripts/pokemon hq4 $br
   ;;
9)  [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon hq5 $br
[[  "$mq" == "1" ]] && /opt/home/scripts/pokemon hq5 $br
   ;;
10) [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon hq6 $br
[[  "$mq" == "1" ]] && /opt/home/scripts/pokemon hq6 $br
   ;;
*) ;;
esac
/opt/home/scripts/popup_timeout  " [ Current Bitrate Updated  ] " 2
elif [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40" ]; then
#NX1
mq=$(prefman get 0 0x00000338  b);  mq=( $mq ) 
mq=${mq[5]}
cb=$( /opt/home/scripts/gbr )
[[  "$cb" == "" ]] && /opt/home/scripts/popup_timeout  " [  Profile Not Adjustable  ] " 2 && exit
br=$(/opt/home/scripts/popup_entry "Current Bitrate ( Mbps ) :" "Apply Change" Cancel $cb number )
[[ "$br" == "" ]]  && exit
[[ "${avail_br[@]}" =~ "${br}" ]] ||  { $(/opt/home/scripts/popup_timeout  " [  Value Not Available  ] " 3) &&  exit ; }
mz=$(prefman get 0 0x00000330  b);  mz=( $mz )
mz=${mz[5]}
case "$mz" in
0)  [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&  /opt/home/scripts/pokemon hq1 $br 
    ;;
1)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&   /opt/home/scripts/pokemon hq1 $br 
    ;;
2)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&   /opt/home/scripts/pokemon hq1 $br 
  ;;
3)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&   /opt/home/scripts/pokemon hq1 $br 
   ;;
4)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&    /opt/home/scripts/pokemon hq2 $br
   ;;
5)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro1 $br 
[[  "$mq" == "1" ]] &&    /opt/home/scripts/pokemon hq2 $br
   ;;
6)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro2 $br 
[[  "$mq" == "1" ]] &&    /opt/home/scripts/pokemon hq3 $br
   ;;
7)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro2 $br 
[[  "$mq" == "1" ]] &&    /opt/home/scripts/pokemon hq3 $br
   ;;
8)   [[  "$mq" == "2" ]] && /opt/home/scripts/pokemon pro2 $br 
[[  "$mq" == "1" ]] &&    /opt/home/scripts/pokemon hq3 $br
   ;;
*) ;;
esac
/opt/home/scripts/popup_timeout  " [ Current Bitrate Updated  ] " 2
fi
killall mod_gui
exit
