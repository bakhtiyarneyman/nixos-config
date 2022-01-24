#!/usr/bin/env bash

function is_powered() {
  if [ -n "$(bluetoothctl show | grep 'Powered: no')" ]; then
    false
  else
    true
  fi
}

function status() {
  if $(is_powered); then
    echo "On"
  else
    echo "Off"
  fi
}

function icon() {
  if $(is_powered); then
    echo ""
  else
    echo ""
  fi
}

case $1 in
  --show)
    text="$(icon)"
    alt="$(icon) $(status)"

    echo "{\"text\": \"$text\",\"alt\": \"$alt\"}"
    ;;
  --toggle)
    if $(is_powered); then
      bluetoothctl power off
    else
      bluetoothctl power on
    fi
    ;;
esac
