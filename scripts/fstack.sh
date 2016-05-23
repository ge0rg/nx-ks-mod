renice -n +10 -p $(pgrep di-camera-app)
nice -n -10 /opt/home/scripts/focus_stack &
