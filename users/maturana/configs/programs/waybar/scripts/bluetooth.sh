#!/usr/bin/env bash

powered=$(bluetoothctl show | grep "Powered" | cut -d' ' -f2)

case $1 in
  --show)
    if [ $powered = no ]; then
        echo 'Off'
    else
        echo 'On'
    fi
    ;;
  --toggle)
    if [ $powered = no ]; then
      bluetoothctl power on
    else
      bluetoothctl power off
    fi
    ;;
esac
