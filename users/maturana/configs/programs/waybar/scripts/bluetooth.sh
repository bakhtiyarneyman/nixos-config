#!/usr/bin/env bash

function is_powered() {
  if bluetoothctl show | grep -q "Powered: yes"; then
    true
  else
    false
  fi
}

icon=$(is_powered && echo "" || echo "")

case $1 in
  --show)
    text="$icon"
    alt="$(is_powered && echo 'On' || echo 'Off')"

    echo "{\"text\":\"$text\",\"alt\":\"$icon $alt\"}"
    ;;
  --toggle)
    if $(is_powered); then
      bluetoothctl power off
    else
      bluetoothctl power on
    fi
    ;;
esac
