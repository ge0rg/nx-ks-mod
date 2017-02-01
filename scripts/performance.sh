#!/bin/bash
st cap capdtm setusr SYSTEMFREQENCYSTATE MOVIE
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
