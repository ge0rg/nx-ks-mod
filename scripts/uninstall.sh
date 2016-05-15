#!/bin/bash
/opt/home/scripts/popup_ok "LOSE ALL THAT GOODNESS ?" UNINSTALL CANCEL; [  $? -eq 0 ] || exit
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.12$ /etc/version.info) = "1.12" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41"  ]; then
  if [ -x /usr/sbin/bluetoothd.orig ]; then
    mv /opt/home/scripts/popup_timeout /sdcard/popup_timeout
    rm -r /opt/home/scripts/
    swapoff /opt/usr/home/swapmod
    rm /opt/usr/home/swapmod
    mount -o remount,rw /
    cd /usr/sbin/
    mv /usr/sbin/bluetoothd.orig /usr/sbin/bluetoothd
    sync;sync;sync
    mount -o remount,ro /
    rm -f /tmp/keyscan.pid
    rm -f /root/focus_stack.cfg
    sync;sync;sync
    /sdcard/popup_timeout  " [  Uninstall complete  ] " 4 &
    rm -f /sdcard/popup_timeout
    sync;sync;sync
    sleep 5
  else
    /opt/home/scripts/popup_timeout  " [  BT-mod isn't here  ] " 4
  fi
fi
reboot
