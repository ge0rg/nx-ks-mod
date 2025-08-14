#!/bin/bash
/opt/usr/nx-ks/popup_ok "LOSE ALL THAT GOODNESS ?" UNINSTALL CANCEL; [  $? -eq 255 ] || exit
if [ "$MODEL" = "NX500" ] ||
 [ "$MODEL" = "NX1"  ]; then
  if [ -x /usr/sbin/bluetoothd.orig ]; then
    mv /opt/usr/nx-ks/popup_timeout /sdcard/popup_timeout
    rm -r /opt/usr/nx-ks/
    swapoff /opt/usr/home/swapmod
    rm /opt/usr/home/swapmod
    mount -o remount,rw /
    cd /usr/sbin/
    mv /usr/sbin/bluetoothd.orig /usr/sbin/bluetoothd
    sync;sync;sync
    mount -o remount,ro /
    rm -f /root/focus_stack.cfg
    sync;sync;sync
    /sdcard/popup_timeout  " [  Uninstall complete  ] " 4 &
    rm -f /sdcard/popup_timeout
    sync;sync;sync
    sleep 5
  else
    /opt/usr/nx-ks/popup_timeout  " [  BT-mod isn't here  ] " 4
  fi
fi
reboot
