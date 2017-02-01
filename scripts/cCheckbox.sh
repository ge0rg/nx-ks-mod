#!/bin/bash
FILE="/sdcard/mod/cCheckbox.sh"
#
if [ ! -f "$FILE" ]; then
    /opt/usr/nx-ks/popup_timeout "cCheckbox does not exists" 2
    /opt/usr/nx-ks/popup_timeout "First create $FILE " 3
	rm /opt/usr/nx-ks/auto/cCheckbox.sh
else
	$("$FILE")&
fi
