#!/bin/bash

DEVICES=$(curl https://fprint.freedesktop.org/supported-devices.html)
SUPPORTED=0

for USBID in $(lsusb | awk '{ print $6 }' | xargs); do
    if [ -n "$(echo $DEVICES | grep -oE $USBID)" ]; then
        echo "Device $USBID has a supported fingerprint sensor"
        SUPPORTED=1
    fi
done

if [ $SUPPORTED -eq 0 ]; then
    echo "Fingerprint scanning not supported :("
    systemctl remove fprintd
    pacman -Rscn fprintd
fi

# fingerprint scanning is supported
