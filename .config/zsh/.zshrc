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
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
	history
)

###############
# ZSH configs #
###############
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=10
export DISABLE_AUTO_UPDATE=true
ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh
source $HOME/.config/.aliases

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
eval "$(pyenv init -)"

# ASDF Version Manager
export ASDF_DATA_DIR="$HOME/.config/asdf"
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$HOME/.config/asdf/tool-versions"
export ASDF_CONFIG_FILE="$HOME/.config/asdf/.asdfrc"
source $HOME/.config/asdf/asdf.sh
