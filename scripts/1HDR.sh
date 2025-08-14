#!/bin/bash
/usr/bin/st app mode m
/usr/bin/st app nx capture af-mode manual
/usr/bin/st cap capdtm setusr AFMODE 0x70003
#
[[ "$MODEL" = "NX1" ]] && prefman set 0 0x0310 l 65
[[ "$MODEL" = "NX500" ]] &&  prefman set 0 0xa340 l 65
/usr/bin/st app mode m ; sleep 1
[[ "$MODEL" = "NX500" ]] &&  st cap capt single start || $(st key push s1 && st key click s2 && st key release s1)
/usr/bin/st app mode m ; sleep 1
#
#
[[ "$MODEL" = "NX1" ]] && prefman set 0 0x0310 l 92
[[ "$MODEL" = "NX500" ]] &&  prefman set 0 0xa340 l 92
/usr/bin/st app mode m ; sleep 1
[[ "$MODEL" = "NX500" ]] &&  st cap capt single start || $(st key push s1 && st key click s2 && st key release s1)
/usr/bin/st app mode m ; sleep 1
#
#
[[ "$MODEL" = "NX1" ]] && prefman set 0 0x0310 l 119
[[ "$MODEL" = "NX500" ]] &&  prefman set 0 0xa340 l 119
/usr/bin/st app mode m ; sleep 1
[[ "$MODEL" = "NX500" ]] &&  st cap capt single start || $(st key push s1 && st key click s2 && st key release s1)
/usr/bin/st app mode m ; sleep 1
#
#
[[ "$MODEL" = "NX1" ]] && prefman set 0 0x0310 l 146
[[ "$MODEL" = "NX500" ]] &&  prefman set 0 0xa340 l 146
/usr/bin/st app mode m ; sleep 1
[[ "$MODEL" = "NX500" ]] &&  st cap capt single start || $(st key push s1 && st key click s2 && st key release s1)
/usr/bin/st app mode m ; sleep 1
#
#
[[ "$MODEL" = "NX1" ]] && prefman set 0 0x0310 l 200
[[ "$MODEL" = "NX500" ]] &&  prefman set 0 0xa340 l 200
/usr/bin/st app mode m ; sleep 1
[[ "$MODEL" = "NX500" ]] &&  st cap capt single start || $(st key push s1 && st key click s2 && st key release s1)
/usr/bin/st app mode m ; sleep 1
#
st key click s1
