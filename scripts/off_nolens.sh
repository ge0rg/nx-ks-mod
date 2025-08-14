#!/bin/bash
if [ "$MODEL" = "NX500" ]; then
	prefman set 0 0xc2dd l 0
elif [ "$MODEL" = "NX1" ]; then
	prefman set 0 0x3071 l 0
fi
exit
