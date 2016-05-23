#!/bin/bash
killall -q mod_gui; killall -q popup_entry ; echo 3 > /proc/sys/vm/drop_caches; sync; sync; sync
$1
