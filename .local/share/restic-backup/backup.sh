#!/bin/bash

source "/home/gunners/.config/secrets"

# Backup config dir
restic backup /home/gunners/.config /etc --exclude-file="/home/gunners/.local/share/restic-backup/excludes.txt" -v

# Remove old backups
restic forget --keep-last 100 --prune
