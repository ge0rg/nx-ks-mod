#!/bin/bash
#
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || { $( st app disp lcd ) &&  sleep 1 ; }
[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] || exit		
#
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
   	if [ ! -x /usr/sbin/bluetoothd.orig ]; then
        /mnt/mmc/scripts/popup_timeout  " [  Installing...  ] " 2 &
        mount -o remount,rw /
        mv /usr/sbin/bluetoothd /usr/sbin/bluetoothd.orig
        cat >/usr/sbin/bluetoothd << EOF
#!/bin/bash
if [ -x /mnt/mmc/scripts/init.sh ]; then
  /mnt/mmc/scripts/init.sh 
fi
EOF
          chmod +x /usr/sbin/bluetoothd
          mount -o remount,ro /
          sleep 5
          /mnt/mmc/scripts/popup_timeout  " [ Installation Complete ] " 2
    else
          /mnt/mmc/scripts/popup_timeout  " [  BT-mod present ] " 2
                /mnt/mmc/scripts/popup_timeout  " [  Reinstalling...  ] " 4 &
                mount -o remount,rw /
                rm /usr/sbin/bluetoothd
                mv /usr/sbin/bluetoothd.orig /usr/sbin/bluetoothd
                chmod +x /usr/sbin/bluetoothd
                mount -o remount,ro /
                sleep 5  
                /mnt/mmc/scripts/popup_timeout  " [  BT-mod Uninstalled...  ] " 2 
                sync;sync;sync
                reboot
    fi
      [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ] && mv /mnt/mmc/scripts/EV_EV.sh /mnt/mmc/scripts/EV_OK.sh
      killall dfmsd
      rm /mnt/mmc/info.tg
      rm /mnt/mmc/nx_cs.adj
      rm /mnt/mmc/install.sh
    sync;sync;sync
    reboot
else 
   	/mnt/mmc/scripts/popup_timeout  " [  Firmware not supported  ] " 2 &
fi
