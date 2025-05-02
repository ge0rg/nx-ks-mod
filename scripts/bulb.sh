#!/bin/sh
# Bulb timer script. Will turn off the screen, press shutter, wait $1 seconds, release shutter
#
# Can be aborted by creating /tmp/stop.flag
rm /tmp/stop.flag

/opt/usr/nx-ks/blackout &

st key push s1 && st key push s2

let i=0 END=${1:-86400}

while [ $i -lt $END -a ! -f /tmp/stop.flag ] ; do
	sleep 1
	if [ $1 ] ; then
		let i++
	fi
done

kill %1

st key release s2 ; st key release s1
