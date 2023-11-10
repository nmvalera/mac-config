#! /usr/env/bin bash

source $HOME/.zshrc

# Install nvm
# Test if nvm is installed and install it if it is not or print already installed message if it is
if test ! $(command -v nvm); then
  echo "Installing nvm..."
  
  # install nvm
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

  echo "Installing Node..."
  nvm install 16
  nvm install 17
  nvm install 21
  
  source $HOME/.zshrc
else
  echo "nvm already installed"
fi

# Install Node

