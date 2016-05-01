#!/bin/bash
/mnt/mmc/scripts/popup_ok "LOSE ALL THAT GOODNESS ?" UNINSTALL CANCEL; [  $? -eq 0 ] || exit
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
  if [ -x /usr/sbin/bluetoothd.orig ]; then
    mount -o remount,rw /
    cd /usr/sbin/
    mv /usr/sbin/bluetoothd.orig /usr/sbin/bluetoothd
    sync;sync;sync
    mount -o remount,ro /
    /mnt/mmc/scripts/popup_timeout  " [  Uninstall complete  ] " 4
  else
    /mnt/mmc/scripts/popup_timeout  " [  BT-mod isn't here  ] " 4
  fi
fi
reboot
