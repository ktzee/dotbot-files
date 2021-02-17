#!/usr/bin/bash

#wall="$HOME/.config/wallpapers/games/poe/kitava.png"
#scheme="$HOME/.config/wallpapers/games/poe/kitava_h1fey.png"
xrandr --output DP-2 --primary --mode 2560x1440 --rate 120 --scale 1.0x1.0 --output HDMI-0 --left-of DP-2 --auto --scale 1.0x1.0
# --primary --mode 2560x1440 --rate 120 --panning 0x0+0+0

# wal -i $scheme -n
# feh --bg-scale $wall

# wal -i "$(< "${HOME}/.cache/wal/wal")"
# xinput set-prop 14 308 -0.7
