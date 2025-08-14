#!/bin/bash
if [ "$MODEL" = "NX500" ]; then
	prefman set 0 0xc2d9 l 1
elif [ "$MODEL" = "NX1" ]; then
	prefman set 0 0x306d l 1
fi
exit
