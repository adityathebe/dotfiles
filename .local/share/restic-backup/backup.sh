#!/bin/bash

source "$HOME/.config/secrets"

# Backup config dir
restic backup $HOME/.config --exclude-file="$HOME/.local/share/restic-backup/excludes.txt"

# Remove old backups
restic forget --keep-last 100 --prune
