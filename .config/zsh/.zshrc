# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Required by tmux to load unicode
# export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Emacs binding
bindkey -e

#######################
## Auto-completion
# Enable Zsh's advanced auto-completion system

autoload -Uz compinit && compinit -C

# do not autoselect the first completion entry
unsetopt menu_complete 

# Use a menu for completion selection
zstyle ':completion:*' menu select

# Load the zsh/complist module for extended completion listing
zmodload zsh/complist

# Better completion from ohmyzsh
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/5b37e218e5275c11cb5fecc61f943e6cea3e64bf/lib/completion.zsh#L23C5-L24C1
# • 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}': Enables case-insensitive matching
# • 'r:|=*': Allows partial-word completion from right to left
# • 'l:|=* r:|=*': Allows partial-word completion from both left and right
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

#######################

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
export HISTSIZE=100000
export SAVEHIST=100000

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
# source /usr/share/nvm/init-nvm.sh

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^E' end-of-line

# Flanksource 
[[ ! -f $PROJECTS_HOME/flanksource/local-setup/env.sh ]] || source $PROJECTS_HOME/flanksource/local-setup/env.sh

# Auto completitions (cached for performance, auto-generated if missing)
_cache_dir="$HOME/.cache/zsh/completions"
mkdir -p "$_cache_dir"

# Cache or eval function
_cache_or_eval() {
    local cache_file="$1"
    local command="$2"
    if [[ ! -f "$cache_file" ]]; then
        eval "$command" > "$cache_file" 2>/dev/null || eval "$command"
    fi
    source "$cache_file" 2>/dev/null || eval "$command"
}

_cache_or_eval "$_cache_dir/_fzf" 'fzf --zsh'
_cache_or_eval "$_cache_dir/_atuin" 'atuin gen-completions --shell zsh'
_cache_or_eval "$_cache_dir/_restic" 'restic generate --zsh-completion /dev/stdout --quiet'
_cache_or_eval "$_cache_dir/_gh" 'gh completion -s zsh'
_cache_or_eval "$_cache_dir/_jj" 'jj util completion zsh'
_cache_or_eval "$_cache_dir/_atuin_init" 'atuin init zsh --disable-up-arrow'
_cache_or_eval "$_cache_dir/_direnv_hook" 'direnv hook zsh'
_cache_or_eval "$_cache_dir/_zoxide_init" 'zoxide init zsh'

unset _cache_dir

# date -u >> ~/zsh_profile_report
# echo "\n\n" >> ~/zsh_profile_report
# zprof >> ~/zsh_profile_report
# echo "\n\n\n\n" >> ~/zsh_profile_report