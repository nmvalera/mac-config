#! /usr/bin/env bash

# Install Rosetta 2
# Test if Rosetta 2 is installed and install it if it is not or print already installed message if it is
if test ! $(which arch); then
  echo "Installing Rosetta 2..."
  softwareupdate --install-rosetta --agree-to-license
else
  echo "Rosetta 2 already installed"
fi

# Set system and application default settings

# System settings

printf "%s\n" "System - Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "%s\n" "System - Remove alert when opening an application downloaded from the Internet"
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Keyboard settings

printf "%s\n" "Keyboard - Automatically illuminate built-in MacBook keyboard in low light"
defaults write com.apple.BezelServices kDim -bool true

printf "%s\n" "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

printf "%s\n" "Keyboard - Enable keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Dock settings
printf "%s\n" "Dock - Remove all default app icons"
defaults write com.apple.dock persistent-apps -array

printf "%s\n" "Dock - Automatically hide and show"
defaults write com.apple.dock autohide -bool true

printf "%s\n" "Dock - Remove the auto-hiding delay"
defaults write com.apple.dock autohide-delay -float 0

printf "%s\n" "Dock - Don’t show recent applications"
defaults write com.apple.dock show-recents -bool false

printf "%s\n" "Dock - Don’t animate opening applications"
defaults write com.apple.dock launchanim -bool false

printf "%s\n" "Dock - Make icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

# Finder settings

printf "%s\n" "Finder - Show hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

printf "%s\n" "Finder - Show filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "%s\n" "Finder - Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

printf "%s\n" "Finder - Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

printf "%s\n" "Finder - Display full POSIX path as window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

printf "%s\n" "Finder - Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

printf "%s\n" "Finder - Show the ~/Library folder"
chflags nohidden $HOME/Library

printf "%s\n" "Finder - Show the /Volumes folder"
sudo chflags nohidden /Volumes

printf "%s\n" "Finder - Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "%s\n" "Finder - Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "%s\n" "Finder - Display quit option"
defaults write com.apple.finder "QuitMenuItem" -bool "true"

# Mouse settings

printf "%s\n" "Mouse - Enable secondary click"
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

# Browser settings

printf "%s\n" "Browser - Make Google Chrome the default browser"
open -a "Google Chrome" --args --make-default-browser
