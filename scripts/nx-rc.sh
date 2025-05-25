#!/bin/bash
#
killall -q nx-input-injector
killall -q xev-nx
killall -q nx-remote-controller-daemon
killall -q onscreen_rc
#
export APP_PATH=/opt/usr/nx-ks/nx-rc

#
showmetheway(){
	while true; do
	IP=`ip addr ls | grep inet | grep -E 'mlan0|uap0' | cut -d/ -f 1 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'`
	[[ -z $IP ]] && IP="Enable WiFi"
	killall onscreen_rc
	nice -n +10 /opt/usr/nx-ks/onscreen_rc "rc: $IP" &
	sleep 4
	done
}
showmetheway&
sleep 1
nice --adjustment=19 $APP_PATH/nx-remote-controller-daemon &> /dev/null &
#tothenextwhiskeybar
