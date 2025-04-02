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

install_cask "1password" # password manager
install_cask "adobe-acrobat-reader" # pdf reader
install_cask "android-studio" # android development
install_cask "appcleaner" # app uninstaller
install_cask "discord" # chat app
install_cask "expressvpn" # vpn
install_cask "gpg-suite" # gpg keychain
install_cask "google-chrome" # web browser
install_cask "google-drive" # cloud storage
install_cask "iterm2" # terminal
install_cask "ledger-live" # crypto wallet
install_cask "obsidian" # note taking app
install_cask "postman" # api testing
install_cask "raycast" # productivity app
install_cask "setapp"  # app marketplace and manager
install_cask "signal" # chat app
install_cask "slack" # chat app
install_cask "telegram" # chat app
install_cask "visual-studio-code" # code editor
install_cask "vuze" # vuze
install_cask "yubico-yubikey-manager" # yubikey manager
install_cask "zoom" # video conferencing