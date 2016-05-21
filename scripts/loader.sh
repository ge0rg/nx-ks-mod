#!/bin/bash
killall -q mod_gui; killall -q popup_entry ; sync; sync; sync
echo 3 > /proc/sys/vm/drop_caches
$1
