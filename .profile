# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
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

# MassDNS
export PATH=$PATH:/usr/local/massdns/bin

# GoLang
export GO111MODULE=on
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Postman
export PATH=/usr/bin/postman:$PATH
 
# Robo3T
export PATH=/usr/bin/robo3t/bin:$PATH
 
# Anaconda
export PATH=~/anaconda3/bin:$PATH

# Chrome Path for Nickjs
export CHROME_PATH=/usr/bin/google-chrome-stable

# NPM Global configuration
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export NODE_REPL_HISTORY=''
