# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG="en_US.UTF-8"

# Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Plugins
plugins=(
	colored-man-pages
  zsh-syntax-highlighting
  zsh-autosuggestions
	history
	systemd
)

###############
# ZSH configs #
###############
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export DISABLE_AUTO_UPDATE=true
ENABLE_CORRECTION=false
DISABLE_MAGIC_FUNCTIONS=true

# Hitory
setopt hist_ignore_all_dups
export HISTSIZE=20000

source $ZSH/oh-my-zsh.sh
source $HOME/.config/.aliases
source $HOME/.config/hacking_aliases.sh
source $HOME/.config/kube_aliases.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# ASDF Version Manager
export ASDF_DATA_DIR="$HOME/.config/asdf"
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$HOME/.config/asdf/tool-versions"
export ASDF_CONFIG_FILE="$HOME/.config/asdf/.asdfrc"
source $HOME/.config/asdf/asdf.sh

# flyctl
export FLYCTL_INSTALL="/home/gunners/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# GF [https://github.com/tomnomnom/gf]
source /home/gunners/.local/share/go/src/github.com/tomnomnom/gf/gf-completion.zsh

# Restic
source $XDG_CONFIG_HOME/zsh/restic-zsh-completion

zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Flanksource 
source $HOME/Projects/flanksource/env.sh
