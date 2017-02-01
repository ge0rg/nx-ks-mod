#!/bin/bash
st cap capdtm setusr SYSTEMFREQENCYSTATE LIVEVIEW
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
