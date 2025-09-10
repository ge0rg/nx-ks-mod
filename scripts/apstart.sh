#!/bin/sh

LOGFILE="/mnt/mmc/softap.log"
HOSTAPD_CONF="/opt/usr/nx-ks/ap/hostapd_uap.conf"
UAP_IF="uap0"
IP_ADDR="192.168.4.1"
SUBNET="255.255.255.0"
UDHCPD_CONF="/opt/usr/nx-ks/ap/udhcp_uap.conf"
UDHCPD_PID="/var/run/udhcpd.pid"
LEASES_FILE="/opt/usr/nx-ks/ap/udhcpd.leases"

# Set regulatory domain to Germany
iw reg set DE >> /dev/null 2>&1

# Retrieve and set MAC address
MAC=$(cat /sys/class/net/${UAP_IF}/address 2>/dev/null)

# Reload WLAN modules
modprobe -r dhd >> /dev/null 2>&1
modprobe dhd >> /dev/null 2>&1
popup_timeout "(1/3) Loading WiFi module.." 1

# Relink entropy source (required for hostapd)
[ -e /dev/random ] || { ln -s /dev/urandom /dev/random >> /dev/null 2>&1; }

# Execute wlan.sh script
/usr/bin/wlan.sh softap >> /dev/null 2>&1

# Start Wi-Fi interface
for i in $(seq 1 10); do
    ip link show "$UAP_IF" >> /dev/null 2>&1 && { break; }
    popup_timeout "(2/3) Starting WiFi interface" 1
done

# Reset interface
ifconfig "$UAP_IF" down >> /dev/null 2>&1
sleep 1
ip addr flush dev "$UAP_IF" >> /dev/null 2>&1
ifconfig "$UAP_IF" up >> /dev/null 2>&1
sleep 1

# Start hostapd
hostapd "$HOSTAPD_CONF" >> /dev/null 2>&1 &
popup_timeout "(3/3) Starting WiFi AP" 1
pgrep hostapd >> /dev/null 2>&1 || { exit 1; }

# Set IP address
ifconfig "$UAP_IF" "$IP_ADDR" netmask "$SUBNET" up >> /dev/null 2>&1

# Prepare udhcpd
rm -f "$LEASES_FILE" >> /dev/null 2>&1
udhcpd "$UDHCPD_CONF" >> /dev/null 2>&1 &
