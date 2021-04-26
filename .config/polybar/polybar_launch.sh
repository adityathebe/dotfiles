#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	bar="main"
	if [[ $m == "eDP-1" ]]; then
		bar="secondary"
	fi

	MONITOR=$m polybar -c "~/.config/polybar/config.ini" --reload "$bar" &
	# MONITOR=$m polybar --reload bottom-bar &
done

echo "Polybar launched..."
