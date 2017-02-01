#!/bin/bash
#
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $( st app disp lcd ) &&  sleep 1 ; }
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || exit   
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.12$ /etc/version.info) = "1.12" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41"  ]; then
    if [ ! -x /usr/sbin/bluetoothd.orig ]; then
        /mnt/mmc/scripts/popup_timeout  " [  Installing...  ] " 4 &
        mount -o remount,rw /
        mv /usr/sbin/bluetoothd /usr/sbin/bluetoothd.orig
        cat >/usr/sbin/bluetoothd << EOF
#!/bin/bash
if [ -x /opt/usr/nx-ks/init.sh ]; then
  /opt/usr/nx-ks/init.sh
fi
EOF
          chmod +x /usr/sbin/bluetoothd
          mount -o remount,ro /
          sleep 5
          mkdir -p /opt/usr/nx-ks
          cp -ar /mnt/mmc/scripts/* /opt/usr/nx-ks/
          sync;sync;sync
          /mnt/mmc/scripts/popup_timeout  " [ Installation Complete ] " 3
    else
          /mnt/mmc/scripts/popup_timeout  " [  BT-mod Detected ] " 2
          /mnt/mmc/scripts/popup_timeout  " [  Let's cleanup...  ] " 4 &
          killall -q keyscan
          killall -q mod_gui
          rm /tmp/keyscan.pid
          rm -r /opt/usr/nx-ks/
          rm -r /opt/home/scripts
          rm /root/mod_lapse.cfg
          swapoff /opt/usr/home/swapmod
          rm /opt/usr/home/swapmod
          mount -o remount,rw /
          rm /usr/sbin/bluetoothd
          mv /usr/sbin/bluetoothd.orig /usr/sbin/bluetoothd
          chmod +x /usr/sbin/bluetoothd
          mount -o remount,ro /
          sleep 5  
          /mnt/mmc/scripts/popup_timeout  " [  System is now Mod-clean...  ] " 3 
          sync;sync;sync
          reboot
    fi
      [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41"  ] && mv /opt/usr/nx-ks/EV_EV.sh /opt/usr/nx-ks/EV_OK.sh
      [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.41$ /etc/version.info) = "1.41"  ] && cp /opt/usr/nx-ks/keyscan1 /opt/usr/nx-ks/keyscan
      killall dfmsd
      rm /mnt/mmc/info.tg
      rm /mnt/mmc/nx_cs.adj
      rm /mnt/mmc/install.sh
      rm /mnt/mmc/NX-KS2_readme.odt
      rm -r /mnt/mmc/scripts/
    sync;sync;sync
    reboot
else 
    /mnt/mmc/scripts/popup_timeout  " [  Firmware not supported  ] " 2 &
fi
