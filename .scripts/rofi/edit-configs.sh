#!/bin/bash

config_files=('Newsboat Urls' 'i3' 'i3blocks' 'sxhkd' 'zsh' 'aliases' 'quit')

function echo_config_files() {
    for config in "${config_files[@]}"; do echo "$config"; done
}

#  Call menu
selected=$( echo_config_files | rofi -dmenu -lines 5 -width 50 -p "Config File : " -font "Overpass 15" )

case "$selected" in
    quit)
        echo "Program terminated." && exit 1
    ;;

    "Newsboat Urls")
        selected="$HOME/.config/newsboat/urls"
    ;;

    i3)
        selected="$HOME/.config/i3/config"
    ;;

    i3blocks)
        selected="$HOME/.config/i3blocks/config"
    ;;

    sxhkd)
        selected="$HOME/.config/sxhkd/sxhkdrc"
    ;;

    zsh)
        selected="$HOME/.config/zsh/.zshrc"
    ;;

    aliases)
        selected="$HOME/.config/.aliases"
    ;;

    *)
        exit 1
    ;;

esac

subl $selected
