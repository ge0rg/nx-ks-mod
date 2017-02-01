#!/bin/bash
filename="/opt/usr/nx-ks/remote.cfg"
rem_c=$( sed -n "1p" "$filename")
	if [ -z "$rem_c" ]; then rem_c="not entered"; fi
rem_s=$( sed -n "2p" "$filename")
	if [ -z "$rem_s" ]; then rem_s="not entered"; fi
rem_u=$( sed -n "3p" "$filename")
	if [ -z "$rem_u" ]; then rem_u="not entered"; fi
rem_p=$( sed -n "4p" "$filename")
	if [ -z "$rem_p" ]; then rem_p="not entered"; fi
#
/opt/usr/nx-ks/rem_gui "$rem_c" "$rem_s" "$rem_u" "$rem_p"
#
