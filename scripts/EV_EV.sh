#!/bin/bash
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $(st app disp lcd) &&  sleep 1 ; }
renice -n -15 -p $$
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/mod_gui $DIR/gui_ini &
/opt/home/scripts/br_menu.sh &
