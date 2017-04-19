#!/bin/bash

#keyboard

setxkbmap -option caps:ctrl_modifier

#first number delay time micro second
#second number key repeat
xset r rate 150 35

if [[ $# > 0 ]]; then
  bash ~/Eclipse/eclipse_mars/eclimd &
fi

ibus-daemon -rd
echo Last login at: $(date) > ~/login.history

#Volume
#pactl -- set-sink-volume 0 200%
