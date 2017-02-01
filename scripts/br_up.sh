#!/bin/bash
tii=($(systemctl show-environment))
for i in "${tii[@]}"; do if [[ $i == "Pro4K="* ]]; then Pro4K=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "ProHD="* ]]; then ProHD=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "Hq4K="* ]]; then Hq4K=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqHD="* ]]; then HqHD=${i:5}; fi; done
for i in "${tii[@]}"; do if [[ $i == "HqVGA="* ]]; then HqVGA=${i:6}; fi; done
for i in "${tii[@]}"; do if [[ $i == "fps="* ]]; then fps=${i:4}; fi; done
for i in "${tii[@]}"; do if [[ $i == "swmo="* ]]; then s=${i:5}; fi; done
#
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
brr+="$(/opt/usr/nx-ks/pokemonche hq6 $HqVGA) "
#
sed -e "s/\${envbr}/$envbr/" -e "s/\${brr}/$brr/" -e "s/\${s}/"$s\ "/"  /opt/usr/nx-ks/init_auto.tp >  /opt/usr/nx-ks/auto/a_init.sh
sync;sync;sync
exit
