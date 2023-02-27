#!/bin/bash

iwgetid -r

if [ $? -eq 0 ]; then
    printf "Skipping WiFi Connect\n"
else

    # Custom SSID & PASS
    IFACE=${IFACE:-"wlan0"}
    MAC=`cat /sys/class/net/$IFACE/address | sed 's/://g' | tail -c 5`
    echo $MAC
    SSID=${SSID:-"wifi-connect-$MAC"}
    PASS=${PASS:-"password-$MAC"}

    printf "Starting WiFi Connect (SSID: $SSID)\n"
    wifi-connect --portal-ssid $SSID --portal-passphrase $PASS

fi

# Start your application here.
sleep infinity
