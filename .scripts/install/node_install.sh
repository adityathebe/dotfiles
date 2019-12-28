# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh
source ~/.zshrc
command -v nvm
nvm install --lts

# Install Yarn repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install Yarn
sudo apt-get update -y && sudo apt-get install --no-install-recommends -y yarn
