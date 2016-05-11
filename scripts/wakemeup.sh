#!/bin/bash
renice -n -50 -p $$
sleepytime=$(/opt/home/scripts/popup_entry "Wake me up in:" "Set Minutes" Cancel)
[[ $sleepytime =~ ^[0-9]+$ ]] || exit
sleepytime=$(($sleepytime*60))
rtcwake -m mem -s $sleepytime && reboot
