#!/bin/bash
if [ -a /tmp/peaking_on ]; then
  rm -f /tmp/peaking_on
  /opt/home/scripts/popup_timeout "Persistent Peaking OFF" 1
else
  touch /tmp/peaking_on
  /usr/bin/st app nx capture af-mode manual
  /usr/bin/st cap capdtm setusr AFMODE 0x70003
  /opt/home/scripts/popup_timeout "Persistent Peaking ON" 1
fi
/usr/bin/st key click ok
