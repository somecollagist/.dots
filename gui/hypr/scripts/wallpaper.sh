#!/usr/bin/env bash

socat -u $XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [[ $line =~ "^monitoraddedv2" ]]; then
    swww img /config/dots/assets/wallpaper.png
  fi
done 