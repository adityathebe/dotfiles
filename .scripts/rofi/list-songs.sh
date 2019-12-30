#!/bin/bash

# I use this script with rofi to enumerate all the audio files in my muysic directory
# The selected song is played with mpc

song=$(mpc listall | rofi -dmenu -i -lines 5 -width 80 -p "Select Song : " -font "Overpass 15");

# Play with mpc
mpc clear;
mpc add "$song";
mpc play;

exit 1;
