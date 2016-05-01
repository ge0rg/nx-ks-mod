#!/bin/bash
if [ $(/bin/grep ^NX500$ /etc/version.info) = "NX500" -a $(/bin/grep ^1.11$ /etc/version.info) = "1.11" ] ||
 [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ]; then
      if [ ! -x /usr/sbin/bluetoothd.orig ]; then
      	[[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /mnt/mmc/scripts/popup_timeout  " [  Installing mod...  ] " 4 &
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
          [[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /mnt/mmc/scripts/popup_timeout  " [  Installed...  ] " 2
      else
          [[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /mnt/mmc/scripts/popup_timeout  " [  BT-mod already present...  ] " 2
      fi
      [ $(/bin/grep   ^NX1$   /etc/version.info) = "NX1" -a $(/bin/grep ^1.40$ /etc/version.info) = "1.40"  ] && mv /mnt/mmc/scripts/EV_EV.sh /mnt/mmc/scripts/EV_OK.sh
      killall dfmsd
      rm /mnt/mmc/info.tg
      rm /mnt/mmc/nx_cs.adj
      rm /mnt/mmc/install.sh
    sync;sync;sync
    reboot
else 
  [[ $(echo $(st cap capdtm getusr MONITOROUT) | grep LCD) > ""  ]] && /mnt/mmc/scripts/popup_timeout  " [  Firmware not supported  ] " 2 &
fi
