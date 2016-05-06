#!/bin/bash
/usr/sbin/bluetoothd.orig
systemctl restart bluetooth-frwk.service
exit
