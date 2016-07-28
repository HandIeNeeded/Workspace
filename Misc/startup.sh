#!/bin/bash

#keyboard

setxkbmap -option caps:ctrl_modifier
xset r rate 160 48

if [[ $# > 0 ]]; then
  bash ~/Eclipse/eclipse_mars/eclimd &
fi


#Volume
#pactl -- set-sink-volume 0 200%
