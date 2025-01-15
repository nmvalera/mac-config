#! /usr/env/bin bash

# Install Applications from Mac App Store

# Test if Brother iPrint&Scan is installed (using mas) and install it if it is not or print already installed message if it is
if test ! $(mas list | grep -w "Brother iPrint&Scan"); then
  echo "Installing Brother iPrint&Scan..."
  mas install 1193539993
else
  echo "Brother iPrint&Scan already installed"
fi
