sudo apt install

# Install zsh
echo "\n\n\nInstalling ZSH"
sudo apt install zsh -y

# Change default shell to zsh
echo "\n\n\nChanging default shell to zsh"
chsh -s $(which zsh)

# Install oh-my-zsh
echo "\n\n\nInstalling oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Plugins
echo "\n\n\nInstalling plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k