# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Include private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Default programs
export TERMINAL="terminator"
export BROWSER="brave"
export FILEBROWSER="nemo"
export GIT_EDITOR="vim"

#############
# ENV PATHS #
#############

# GoLang
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Robo3T
export PATH=/usr/bin/robo3t/bin:$PATH
 
# Chrome Path for Nickjs
export CHROME_PATH=/usr/bin/google-chrome-stable

export NODE_REPL_HISTORY=''
