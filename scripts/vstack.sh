#!/bin/bash
renice -n -50 -p $$
renice -n -50 -p $(pgrep di-camera-app)
#
focusto() {
	af_info=($(st cap iq af pos))
	pos_temp=${af_info[2]} 
	pos_mv=$(( $1-$pos_temp ))
	st cap iq af mv 10 $pos_mv 0
	while [ $pos_temp -ne $1 ]; do
		af_info=($(st cap iq af pos))
		pos_temp=${af_info[2]} 
	    sleep 0.2
	done
}
startrec(){
	st key click del; sleep 1; st key click fn; sleep 2;
	st key click rec;
	while [[ "${hevc[1]}" -ne "ON" ]]; do
		hevc=($(st pmu show | grep hevc));
	    sleep 0.5;
	done
}
focusto $1;
#startrec;  sleep 1;
st key click del; sleep 1; st key click fn; sleep 2;
st key click rec; sleep 7;
focusto $2; sleep 1;
st key click rec;

exit
