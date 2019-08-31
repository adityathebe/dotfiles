# Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  history
)

# Chrome (For NickJS)
export CHROME_PATH=/usr/bin/google-chrome-stable

###############
# ZSH configs #
###############
export ZSH="/home/gunners/.oh-my-zsh"
export UPDATE_ZSH_DAYS=3
source $ZSH/oh-my-zsh.sh
ENABLE_CORRECTION="true"

###########
# Aliases #
###########
alias ll='ls -l'
alias lh='ls -alF'
alias lg='ls -alF | grep'
alias zshconfig="vim ~/.zshrc"
alias sleep="systemctl suspend"
alias androidstudio="~/Softwares/android-studio/bin/studio.sh"
alias bitcoin="~/Softwares/bitcoin-com-wallet/Bitcoin.com"
alias electrum="~/Softwares/electrum-3.3.5-x86_64.AppImage"
alias rss="newsboat"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias i3bconf='vim ~/.i3blocks.conf'
alias i3conf='vim ~/.config/i3/config'
alias ip='curl https://api.ipify.org/'
alias du='du -ch'
alias df='df -h'
alias indiana="TZ=\":America/Indiana/Indianapolis\" date \"+%I:%M%P\""
alias jp="jupyter notebook ."
alias cp="rsync -ah --progress"

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

