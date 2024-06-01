# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Required by tmux to load unicode
# export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Emacs binding
bindkey -e

ENABLE_CORRECTION=false

# Basic auto/table completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Better completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# show hidden files during auto completion
_comp_options+=(globdots)

######################
# Keybindings
# Credit: https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/key-bindings.zsh
######################

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

# [Delete] - delete forward
bindkey -M emacs "^[[3~" delete-char

# Bind Home/End keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

##########
# HISTORY
# Credit: https://registerspill.thorstenball.com/p/which-command-did-you-run-1731-days
##########

export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=500000000
export SAVEHIST=500000000

# Immediately append to history file:
setopt INC_APPEND_HISTORY

# Record timestamp in history:
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST

# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS

# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS

# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS

# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE

# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS

# Share history between all sessions:
setopt SHARE_HISTORY

# Execute commands using history (e.g.: using !$) immediatel:
unsetopt HIST_VERIFY

#############
# Sources
#############
source $HOME/.config/.aliases
source $HOME/.config/hacking_aliases.sh
source $HOME/.config/kube_aliases.sh

#############
# Plugins
#############
source "$XDG_DATA_HOME/zsh/powerlevel10k/powerlevel10k.zsh-theme"
source "$XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_DATA_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$XDG_DATA_HOME/zsh/plugins/you-should-use/you-should-use.plugin.zsh"

## Auto completitions
source <(atuin gen-completions --shell zsh)
source <(helm completion zsh)
source <(restic generate --zsh-completion /dev/stdout --quiet)
source <(gh completion -s zsh)

if [[ -r "$HOME/.local/share/go/src/github.com/tomnomnom/gf/gf-completion.zsh" ]]; then
	source $HOME/.local/share/go/src/github.com/tomnomnom/gf/gf-completion.zsh # [https://github.com/tomnomnom/gf]
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^E' end-of-line

# Flanksource 
[[ ! -f $PROJECTS_HOME/flanksource/local-setup/env.sh ]] || source $PROJECTS_HOME/flanksource/local-setup/env.sh

# Atuin
eval "$(atuin init zsh --disable-up-arrow)"

# Direnv
eval "$(direnv hook zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# zprof
