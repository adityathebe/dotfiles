#!/bin/zsh

# Map CAPS to CTRL
setxkbmap -option ctrl:ctrl_modifier

# Start the gnome-keyring-daemon from xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Change cursor
xsetroot -cursor_name left_ptr &

# Display Power Management Signaling
# dpms: Enable/disable Display Power Management Signaling
# 0 0 0: Standby, Suspend and Off timeout values in seconds
# b off: Turns off the bell
# r rate: Set the keyboard auto repeat rate and delay
# 500 30: The values for the auto repeat rate (characters per second) and delay (milliseconds).
xset dpms 0 0 0 b off r rate 200 60

# Set 2k res, 165Hz on the DP
xrandr --output 'DP-4' --mode 2560x1440 --rate 164.83

# Screensaver
xset s 0

sxhkd -m 1 &
dunst &
flameshot &
picom --config ~/.config/picom/picom.conf &
pasystray &
redshift-gtk &
# blueman-applet &
nm-applet &
numlockx &

exec bspwm
