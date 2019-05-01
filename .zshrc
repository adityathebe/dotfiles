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
alias uli="nautilus ~/.uli &; disown"
alias androidstudio="~/Softwares/android-studio/bin/studio.sh"
alias bitcoin="~/Softwares/bitcoin-com-wallet/Bitcoin.com"
alias electrum="~/Softwares/electrum-3.3.4-x86_64.AppImage"
alias rss="newsboat"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias i3bconf='vim ~/.i3blocks.conf'
alias i3conf='vim ~/.config/i3/config'
alias ip='curl https://api.ipify.org/'
alias du='du -ch'
alias df='df -h'
