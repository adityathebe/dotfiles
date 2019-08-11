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
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#############
# ENV PATHS #
#############
 
export PATH=/home/gunners/Softwares/electrum-3.3.4-x86_64.AppImage:$PATH

# Postman
export PATH=/usr/bin/postman:$PATH
 
# Robo3T
export PATH=/usr/bin/robo3t/bin:$PATH
 
# Anaconda
export PATH=~/anaconda3/bin:$PATH

# PipEnv
export PATH=~/.local/bin:$PATH

# WebStorm
export PATH=/opt/WebStorm-192.5728.87/bin:$PATH

# PyCharm
export PATH=/opt/pycharm-2019.2/bin:$PATH

# NPM Global configuration
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
