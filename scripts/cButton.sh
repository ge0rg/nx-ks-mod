#!/bin/bash
FILE="/sdcard/mod/cButton.sh"
#
if [ ! -f "$FILE" ]; then
    /opt/usr/nx-ks/popup_timeout "cButton does not exists" 2
    /opt/usr/nx-ks/popup_timeout "First create $FILE " 3
else
	$("$FILE")&
fi
