#!/bin/bash
killall -q keyscan
killall -q mod_gui
rm /tmp/keyscan.pid
sync;sync;sync
/opt/home/scripts/popup_ok "Restart Keyscan in 3 minutes ?" YES NO; [  $? -eq 0 ] || exit
sleep 180
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/keyscan /dev/event0 /dev/event1 $DIR
