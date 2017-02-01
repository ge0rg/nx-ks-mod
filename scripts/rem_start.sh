#!/bin/bash
filename="/opt/usr/nx-ks/remote.cfg"
rem_c=$( sed -n "1p" "$filename")
	if [ -z "$rem_c" ]; then rem_c="127.0.0.1"; fi
rem_s=$( sed -n "2p" "$filename")
	if [ -z "$rem_s" ]; then rem_s="/"; fi
rem_u=$( sed -n "3p" "$filename")
	if [ -z "$rem_u" ]; then rem_u="anonymous"; fi
rem_p=$( sed -n "4p" "$filename")
	if [ -z "$rem_p" ]; then rem_p="@admin"; fi
#
if [ ! -f /opt/storage/sdcard/nx-netfs/remote_storage.sh ]; then
	rm /opt/usr/nx-ks/auto/rem.sh; sync;sync;sync;
    /opt/usr/nx-ks/popup_timeout  "Install nx-netfs first !" 5
else
	cd /opt/usr/nx-ks/nx-netfs
	/opt/storage/sdcard/nx-netfs/remote_storage.sh start "$rem_c" "$rem_s" "$rem_u" "$rem_p"	
fi
#
