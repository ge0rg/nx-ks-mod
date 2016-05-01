#!/bin/bash
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || exit
renice -n -15 -p $$
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/mod_gui $DIR/gui_ini &
/mnt/mmc/scripts/br_menu.sh &
