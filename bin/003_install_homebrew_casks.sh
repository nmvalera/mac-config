#! /usr/bin/env bash

# Install Homebrew Casks

install_cask() {
  cask=$1
  if test ! $(brew list --cask | grep -i "$cask"); then
    echo "Installing $cask..."
    brew install --cask $cask
  else
    echo "$cask already installed"
  fi
}

install_cask "1password"
install_cask "adobe-acrobat-reader"
install_cask "appcleaner"
install_cask "discord"
install_cask "expressvpn"
install_cask "gpg-suite"
install_cask "google-chrome"
install_cask "iterm2"
install_cask "ledger-live"
install_cask "postman"
install_cask "raycast"
install_cask "setapp"
install_cask "signal"
install_cask "slack"
install_cask "telegram"
install_cask "visual-studio-code"
install_cask "yubico-yubikey-manager"
install_cask "zoom"