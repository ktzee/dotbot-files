#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec i3
# exec cinnamon-session
# exec xfce4-session
#while true; do
#	/usr/local/bin/dwm 2> /dev/null
#done
# exec startplasma-x11 
# exec gnome-session 
