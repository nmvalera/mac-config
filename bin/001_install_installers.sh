#! /usr/bin/env bash

# Test if homebrew is installed and install it if it is not or upgrade it if it is
if test ! $(which brew); then
  echo "Installing homebrew..."
  
  # install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # add homebrew to the path
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/nmvalera/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  source ~/.zshrc
else
  # upgrade homebrew to latest version
  echo "Homebrew already installed"
  echo "Upgrading homebrew..."
  brew update
  brew upgrade  
fi

# Test if python and pip are installed and install them (using brew) if they are not or print already installed message if they are
if test ! $(which python3); then
  echo "Installing python..."
  brew install python

  brew install pyenv pyenv-virtualenv
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
  pyenv install 3.12.0
else
  echo "python already installed"
fi


# Test if mas is installed and install it (using brew) if it is not or print already installed message if it is
if test ! $(which mas); then
  echo "Installing mas..."
  brew install mas
else
  echo "mas already installed"
fi

