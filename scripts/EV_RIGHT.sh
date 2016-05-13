#!/bin/bash
renice -n -50 -p $$
renice -n +50 -p $(pgrep di-camera-app)
#
#st cap lens focus far   > /dev/null
#af_info=($(st cap iq af pos))
#pos_far=${af_info[2]} 
#
st cap lens focus near  > /dev/null
sleep 1
#af_info=($(st cap iq af pos))
#pos_near=${af_info[2]} 
#
#mv=$(( $pos_near-$pos_far ))
mv=300
#
st cap iq af mv 10 -$mv 3 > /dev/null; sleep 3
st cap iq af mv 10 $mv 3  > /dev/null; sleep 3
st cap iq af mv 10 -$mv 3 > /dev/null; sleep 3
st cap iq af mv 10 $mv 3  > /dev/null; sleep 3
st cap iq af mv 10 -$mv 3 > /dev/null; sleep 3
st cap iq af mv 10 $mv 3  > /dev/null; sleep 3
st cap iq af mv 10 -$mv 3 > /dev/null; sleep 3
st cap iq af mv 10 $mv 3  > /dev/null; sleep 3
