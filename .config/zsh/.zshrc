# Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  history
)

###############
# ZSH configs #
###############
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=3

ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh
source $HOME/.config/.aliases


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gunners/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gunners/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gunners/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gunners/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v
