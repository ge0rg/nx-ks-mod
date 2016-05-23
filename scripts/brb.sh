#!/bin/bash
renice -n -10 -p $$
st key click rec;
sleep 0.5
renice -n +50 -p $(pgrep di-camera-app)
