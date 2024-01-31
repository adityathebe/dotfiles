# Used to execute commands just after logging in
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep bspwm ||  startx
fi
