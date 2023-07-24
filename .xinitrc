#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
# [ -f /etc/xprofile ] &&  . /etc/xprofile
# [ -f /home/ktz/.xprofile ] && . /home/ktz/.xprofile

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 200 40
exec i3
# exec cinnamon-session
# exec xfce4-session
# export DESKTOP_SESSION=plasma
# exec startplasma-x11
# exec gnome-session
# exec /usr/local/bin/dwm
# exec /home/ktz/.scripts/exec-dwm.sh
# dbus-launch leftwm
# exec qtile start
# exec awesome
