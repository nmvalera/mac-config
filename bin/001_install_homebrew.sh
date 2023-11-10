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
