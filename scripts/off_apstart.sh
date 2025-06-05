#!/bin/sh

LOGFILE="/dev/null"
# uncomment next line for logging
#LOGFILE="/mnt/mmc/softap.log"
UAP_IF="uap0"
UDHCPD_PID="/var/run/udhcpd.pid"

echo "Stopping udhcpd and hostapd..."

# Stop udhcpd (falls PID-Datei vorhanden)
if [ -f "$UDHCPD_PID" ]; then
    kill "$(cat "$UDHCPD_PID")" 2>/dev/null
    rm -f "$UDHCPD_PID"
else
    pkill udhcpd 2>/dev/null
fi

# Stop hostapd
pkill hostapd 2>/dev/null

# Deactivate the interface
ifconfig "$UAP_IF" down 2>/dev/null
ip addr flush dev "$UAP_IF" 2>/dev/null

# Execute wlan.sh script
/usr/bin/wlan.sh force_stop >> $LOGFILE 2>&1

popup_timeout "WiFi AP stopped." 1
