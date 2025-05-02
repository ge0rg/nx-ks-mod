#!/bin/sh

LOGFILE="/mnt/mmc/softap.log"
HOSTAPD_CONF="/opt/usr/nx-ks/ap/hostapd_uap.conf"
UAP_IF="uap0"
IP_ADDR="192.168.4.1"
SUBNET="255.255.255.0"
UDHCPD_CONF="/opt/usr/nx-ks/ap/udhcp_uap.conf"
UDHCPD_PID="/var/run/udhcpd.pid"
LEASES_FILE="/opt/usr/nx-ks/ap/udhcpd.leases"

sleep 5

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOGFILE"
}

# Set regulatory domain to Germany
log "Setting regulatory domain to DE..."
iw reg set DE >> "$LOGFILE" 2>&1 && log "Regulatory domain set to DE." || log "Failed to set regulatory domain to DE."

# Retrieve and set MAC address
log "Retrieving MAC address for interface $UAP_IF..."
MAC=$(cat /sys/class/net/${UAP_IF}/address 2>> "$LOGFILE")
log "MAC address retrieved: $MAC"

# Reload WLAN modules
log "Reloading WLAN modules..."
modprobe -r dhd >> "$LOGFILE" 2>&1 && log "WLAN module 'dhd' removed successfully." || log "Failed to remove WLAN module 'dhd', continuing..."
modprobe dhd >> "$LOGFILE" 2>&1 && log "WLAN module 'dhd' loaded successfully." || log "Failed to load WLAN module 'dhd'."
sleep 2

# Relink entropy source (required for hostapd)
log "Checking entropy source..."
[ -e /dev/random ] || { ln -s /dev/urandom /dev/random >> "$LOGFILE" 2>&1 && log "Entropy source relinked to /dev/urandom."; }

log "Executing wlan.sh script..."
/usr/bin/wlan.sh softap >> "$LOGFILE" 2>&1 && log "wlan.sh executed successfully." || log "Error executing wlan.sh."

# Start Wi-Fi interface
log "Initializing Wi-Fi interface $UAP_IF..."
for i in $(seq 1 10); do
    ip link show "$UAP_IF" >> "$LOGFILE" 2>&1 && { log "Wi-Fi interface $UAP_IF is up."; break; }
    sleep 1
done

# Reset interface
log "Resetting interface $UAP_IF..."
ifconfig "$UAP_IF" down >> "$LOGFILE" 2>&1 && log "Interface $UAP_IF brought down." || log "Failed to bring down interface $UAP_IF."
sleep 1
ip addr flush dev "$UAP_IF" >> "$LOGFILE" 2>&1 && log "IP address flushed for $UAP_IF." || log "Failed to flush IP address for $UAP_IF."
ifconfig "$UAP_IF" up >> "$LOGFILE" 2>&1 && log "Interface $UAP_IF brought up." || log "Failed to bring up interface $UAP_IF."
sleep 1

# Start hostapd
log "Starting hostapd with configuration $HOSTAPD_CONF..."
hostapd "$HOSTAPD_CONF" >> "$LOGFILE" 2>&1 &
sleep 2
pgrep hostapd >> "$LOGFILE" 2>&1 && log "hostapd is running." || {
    log "Failed to start hostapd."; exit 1;
}

# Set IP address
log "Configuring IP address $IP_ADDR with subnet $SUBNET on $UAP_IF..."
ifconfig "$UAP_IF" "$IP_ADDR" netmask "$SUBNET" up >> "$LOGFILE" 2>&1 && log "IP address configured successfully." || log "Failed to configure IP address."

# Prepare udhcpd
log "Removing old lease file $LEASES_FILE..."
rm -f "$LEASES_FILE" >> "$LOGFILE" 2>&1 && log "Old lease file removed." || log "Failed to remove old lease file."

log "Starting udhcpd with configuration $UDHCPD_CONF..."
udhcpd -f "$UDHCPD_CONF" >> "$LOGFILE" 2>&1 && log "udhcpd started successfully." || log "Failed to start udhcpd."
