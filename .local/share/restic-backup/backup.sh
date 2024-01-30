#!/bin/bash

source "/home/gunners/.config/secrets"

# Generated pacman packages
pacman -Q > "/home/gunners/.local/share/pacman-packages/$(date +'%Y-%m-%d-%H-%M-%S').txt"

# Backup config dir
restic backup --files-from="/home/gunners/.local/share/restic-backup/includes.txt" --exclude-file="/home/gunners/.local/share/restic-backup/excludes.txt" -v

# Remove old backups
restic forget --keep-last 200 --prune
