#!/bin/zsh

[ -f "$HOME/.config/env" ] && source "$HOME/.config/env"

# Start the gnome-keyring-daemon from xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Change cursor
xsetroot -cursor_name left_ptr &

# Display Power Management Signaling
xset dpms 0 0 0 b off r rate 500 30

# Screensaver
xset s 0

sxhkd -m 1 &
dunst &
flameshot &
picom --config ~/.config/picom/picom.conf &
pasystray &
redshift-gtk &
blueman-applet &
nm-applet &
numlockx &

exec bspwm
