# Profile file.
# Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export XDG_CONFIG_HOME=$HOME/.config

# Fix for Intellij bspwm issue
export _JAVA_AWT_WM_NONREPARENTING=1

# Maven
export PATH=$PATH:$HOME/Softwares/Java/apache-maven-3.6.3/bin/
export M2_HOME=$HOME/.m2/

# Default applications
export TERMINAL=alacritty
export GIT_EDITOR=nvim
export EDITOR=nvim
export BROWSER=brave

export PATH="$HOME/.cargo/bin:$PATH"
