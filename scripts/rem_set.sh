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
if [[ $1 == 'rem_c' ]]; then 
	rem_c=$(/opt/usr/nx-ks/popup_entry "Remote Computer:" SET DELETE "$rem_c" )
fi
#
if [[ $1 == 'rem_s' ]]; then 
	rem_s=$(/opt/usr/nx-ks/popup_entry "Share Directory:" SET DELETE "$rem_s" )
fi
#
if [[ $1 == 'rem_u' ]]; then 
	rem_u=$(/opt/usr/nx-ks/popup_entry "Username:" SET DELETE "$rem_u" )
fi
#
if [[ $1 == 'rem_p' ]]; then 
	rem_p=$(/opt/usr/nx-ks/popup_entry "Password:" SET DELETE "$rem_p" )
fi
#
echo $rem_c > $filename
echo $rem_s >> $filename
echo $rem_u >> $filename
echo $rem_p >> $filename
#
sync;sync;sync;sleep 0.1;
#
if [ -z "$rem_c" ]; then rem_c="not entered"; fi
if [ -z "$rem_s" ]; then rem_s="not entered"; fi
if [ -z "$rem_u" ]; then rem_u="not entered"; fi
if [ -z "$rem_p" ]; then rem_p="not entered"; fi
#
/opt/usr/nx-ks/rem_gui "$rem_c" "$rem_s" "$rem_u" "$rem_p"
#
filename="/opt/usr/nx-ks/remote.cfg"
while IFS='' read -r line || [[ -n "$line" ]]; do echo "Text read from file: $line"  done < "$filename"
#
read -r line < "$filename"

