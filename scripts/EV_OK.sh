#!/bin/bash
if ! killall -q onscreen_235
  then
	 nice -n +15 /opt/usr/nx-ks/onscreen_235 &
fi 
