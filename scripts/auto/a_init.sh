#!/bin/bash
renice -n -10 -p $$
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /opt/usr/nx-ks/popup_timeout  " [ Initial Setup ... ] " 3 &
#############################################
Pro4K=160; ProHD=180; Hq4K=90; HqHD=90; HqVGA=180 ; fps=4
#############################################
envbr="Pro4K=$Pro4K ProHD=$ProHD Hq4K=$Hq4K HqHD=$HqHD HqVGA=$HqVGA fps=$fps"
#
brr="$(/opt/usr/nx-ks/pokemonche pro1 $Pro4K) "
brr+="$(/opt/usr/nx-ks/pokemonche pro2 $ProHD) "
brr+="$(/opt/usr/nx-ks/pokemonche pro3 $ProHD) "
brr+="$(/opt/usr/nx-ks/pokemonche hq1 $Hq4K) "
brr+="$(/opt/usr/nx-ks/pokemonche hq2 $HqHD) "
brr+="$(/opt/usr/nx-ks/pokemonche hq3 $HqHD) "
brr+="$(/opt/usr/nx-ks/pokemonche hq4 $HqHD) "
brr+="$(/opt/usr/nx-ks/pokemonche hq5 $HqVGA) "
brr+="$(/opt/usr/nx-ks/pokemonche hq6 $HqVGA)"
#
$( sleep 7 && sync;sync;sync && /opt/usr/nx-ks/auto/a_init.sh && sync;sync;sync ) &
$( sleep 8 && /opt/usr/nx-ks/popup_timeout  " [ All Done - Enjoy ] " 3 ) &
#
sed -e "s/\${envbr}/""$envbr""/" -e "s/\${brr}/""$brr""/" -e "s/\${s}/"$s\ "/"  /opt/usr/nx-ks/init_auto.tp >  /opt/usr/nx-ks/auto/a_init.sh &
