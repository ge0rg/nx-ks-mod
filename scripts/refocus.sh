#!/bin/bash
af_info=($(st cap iq af pos))
st cap iq af mv 10 $(($(head -n 1 /sdcard/presets/hib) - ${af_info[2]} )) 10
