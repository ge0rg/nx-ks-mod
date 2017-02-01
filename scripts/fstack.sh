renice -n +10 -p $(pgrep di-camera-app)
nice -n -10 /opt/usr/nx-ks/focus_stack &
