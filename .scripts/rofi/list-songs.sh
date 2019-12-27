#!/bin/bash

# I use this script with rofi to enumerate all the mp3 and m4a files in ~/Music directory
# The selected song will be played with ffplay

song=$(find "$HOME/Music" -type f \( -name "*.mp3" -o -name "*.m4a" \) | rofi -dmenu -i -lines 5 -width 50 -p "Select Song : " -font "Overpass 15")

ffplay -autoexit "$song"

