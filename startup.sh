#!/bin/bash

#keyboard

while true; do
  setxkbmap -option caps:ctrl_modifier
  xset r rate 160 45
  sleep 1h
done

#Volume
#pactl -- set-sink-volume 0 200%
