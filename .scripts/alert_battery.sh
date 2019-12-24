#!/bin/bash

while true
do
  export DISPLAY=:0.0
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
  if on_ac_power; then
    if [ $battery_level -ge 85 ]; then
      notify-send "Battery level above 85%" "Level: ${battery_level}% "
      sleep 20
    fi
  elsek
    if [ $battery_level -le 20 ]; then
      notify-send "Please plug your AC adapter." "Charging: ${battery_level}%"
      sleep 20
    fi

    if [ $battery_level -le 7 ]; then
      if ! on_ac_power; then
          gnome-screensaver-command -l   ## lock the screen if you don't plug AC adapter after 20 seconds
      fi
    fi
  fi

  sleep 300 # 300 seconds or 5 minutes
done
