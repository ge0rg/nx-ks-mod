#!/bin/bash
#
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $( st app disp lcd ) &&  sleep 1 ; }
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || exit   
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
    if [ ! -x /usr/sbin/bluetoothd.orig ]; then
        /mnt/mmc/scripts/popup_timeout  " [  Installing...  ] " 4 &
        mount -o remount,rw /
        mv /usr/sbin/bluetoothd /usr/sbin/bluetoothd.orig
        cat >/usr/sbin/bluetoothd << EOF
#!/bin/bash
if [ -x /opt/home/scripts/init.sh ]; then
  /opt/home/scripts/init.sh
fi
EOF
          chmod +x /usr/sbin/bluetoothd
          mount -o remount,ro /
          sleep 5
          mkdir -p /opt/home/scripts
          cp -ar /mnt/mmc/scripts/* /opt/home/scripts/
          sync;sync;sync
          /mnt/mmc/scripts/popup_timeout  " [ Installation Complete ] " 2
    else
          /mnt/mmc/scripts/popup_timeout  " [  BT-mod Detected ] " 2
          /mnt/mmc/scripts/popup_timeout  " [  Let's cleanup...  ] " 4 &
          killall -q keyscan
          killall -q mod_gui
          rm /tmp/keyscan.pid
          rm -r /opt/home/scripts/
          swapoff /opt/usr/home/swapmod
          rm /opt/usr/home/swapmod
          mount -o remount,rw /
          rm /usr/sbin/bluetoothd
          mv /usr/sbin/bluetoothd.orig /usr/sbin/bluetoothd
          chmod +x /usr/sbin/bluetoothd
          mount -o remount,ro /
          sleep 5  
          /mnt/mmc/scripts/popup_timeout  " [  System is now Mod-clean...  ] " 2 
          sync;sync;sync
          reboot
    fi
      [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ] && 
      mv /opt/home/scripts/EV_EV.sh /opt/home/scripts/EV_OK.sh || rm -f /opt/home/scripts/EV_RIGHT.sh
      killall dfmsd
      rm /mnt/mmc/info.tg
      rm /mnt/mmc/nx_cs.adj
      rm /mnt/mmc/install.sh
      rm /mnt/mmc/NX-KS_readme.odt
      rm -r /mnt/mmc/scripts/
    sync;sync;sync
    reboot
else 
    /mnt/mmc/scripts/popup_timeout  " [  Firmware not supported  ] " 2 &
fi
