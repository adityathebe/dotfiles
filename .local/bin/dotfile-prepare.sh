#!/bin/bash

set -e

home='/home/gunners'
dotfile="/usr/bin/git --git-dir=$home/.dotfilesGitBareRepo --work-tree=$home"
list=(
  "$home/.xinitrc"
  "$home/.xprofile"
  "$home/.zshenv"
  "$home/.github"

  "$home/.local/bin/dotfile-prepare.sh"
  "$home/.local/bin/statusbar"
  "$home/.local/bin/transmission-add-torrent"
  "$home/.local/bin/list-songs"
  "$home/.local/bin/my-github-repo-opener"
  "$home/.local/bin/monitor-setup"

  "$home/.local/share/applications/torrent.desktop"
  "$home/.local/share/restic-backup"
  "$home/.local/share/restic-backup"
  
  "$home/.config/.aliases"
  "$home/.config/Code/User/profiles/-756faeda/settings.json"
  "$home/.config/alacritty/alacritty.toml"
  "$home/.config/atuin/config.toml"
  "$home/.config/betterlockscreenrc"
  "$home/.config/bottom/bottom.toml"
  "$home/.config/bspwm/bspwmrc"
  "$home/.config/dunst/dunstrc"
  "$home/.config/env"
  "$home/.config/fastfetch/config.jsonc"
  "$home/.config/fontconfig/10-powerline-symbols.conf"
  "$home/.config/fontconfig/fonts.conf"
  "$home/.config/git/better-git-branch.sh"
  "$home/.config/git/config"
  "$home/.config/hacking_aliases.sh"
  "$home/.config/kube_aliases.sh"
  "$home/.config/mpd/mpd.conf"
  "$home/.config/mpv/input.conf"
  "$home/.config/mpv/mpv.conf"
  "$home/.config/ncmpcpp/bindings"
  "$home/.config/ncmpcpp/config"
  "$home/.config/newsboat/config"
  "$home/.config/newsboat/urls"
  "$home/.config/picom/picom.conf"
  "$home/.config/polybar/config.ini"
  "$home/.config/polybar/polybar_launch.sh"
  "$home/.config/rofi/config.rasi"
  "$home/.config/rofi/nord.rasi"
  "$home/.config/sxhkd/sxhkdrc"
  "$home/.config/sxhkd/sxhkdrc"
  "$home/.config/tmux/tmux.conf"
  "$home/.config/transmission-daemon/settings.json"
  "$home/.config/wget/wgetrc"
  "$home/.config/zathura/zathurarc"

  # zsh
  "$home/.config/zsh/.zprofile"
  "$home/.config/zsh/.p10k.zsh"
  "$home/.config/zsh/.zshrc"

  # Yazi
  "$home/.config/yazi/yazi.toml"
  "$home/.config/yazi/theme.toml"
  "$home/.config/yazi/keymap.toml"
)

for item in ${list[@]}; do
  echo "Adding $item"
  $dotfile add $item
done
