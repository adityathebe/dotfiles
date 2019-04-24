# Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  history
)

# NPM Global configuration
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#############
# ENV PATHS #
#############

# Postman
export PATH=/usr/bin/postman:$PATH

# Robo3T
export PATH=/usr/bin/robo3t/bin:$PATH

# Anaconda
export PATH=~/anaconda3/bin:$PATH

# Chrome (For NickJS)
export CHROME_PATH=/usr/bin/google-chrome-stable

# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools



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

alias ytd='youtube-dl -f bestvideo+bestaudio --prefer-free-formats -i --output "%(title)s.%(ext)s"'
alias yta='youtube-dl -x -f bestaudio --prefer-free-formats -i --output "%(title)s.%(ext)s"'
alias ll='ls -l'
alias lh='ls -alF'
alias lg='ls -alF | grep'
alias zshconfig="nano ~/.zshrc"
alias d="cd ~/Desktop"
alias home="cd ~"
alias sleep="systemctl suspend"
alias agenda="gcalcli agenda"
alias uli="nautilus ~/.uli &"
alias androidstudio="~/Softwares/android-studio/bin/studio.sh"
alias bitcoin="~/Softwares/bitcoin-com-wallet/Bitcoin.com"
alias electrum="~/Softwares/electrum-3.3.4-x86_64.AppImage"
alias rss="newsboat"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
