#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] &&  . /etc/xprofile
[ -f /home/ktz/.xprofile ] && . /home/ktz/.xprofile

# exec i3
# exec cinnamon-session
exec xfce4-session
# exec startplasma-x11
# exec gnome-session
# exec /usr/local/bin/dwm
# exec /home/ktz/.scripts/exec-dwm.sh
# exec xmonad
# dbus-launch leftwm
