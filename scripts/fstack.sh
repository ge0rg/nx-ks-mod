renice -n -50 -p $(pgrep di-camera-app)
nice -n -50 /opt/home/scripts/focus_stack &
