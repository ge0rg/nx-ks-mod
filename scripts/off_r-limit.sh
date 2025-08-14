#!/bin/bash
if [ "$MODEL" = "NX500" ]; then
	prefman set 0 0xc2d9 l 0
elif [ "$MODEL" = "NX1" ]; then
	prefman set 0 0x306d l 0
fi
exit
