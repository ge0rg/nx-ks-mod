#!/bin/bash
pkill -f  bluetooth
systemctl stop bluetooth-frwk.service
