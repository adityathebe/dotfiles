#  Profile file.
# Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export XDG_CONFIG_HOME=$HOME/.config


export TERMINAL=termite
export GIT_EDITOR=nvim
