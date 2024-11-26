#! /usr/env/bin bash

# if rust is not installed, install it
if test ! $(command -v rustc); then
  echo "Installing Rust..."
  
  # install rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

else
  echo "Rust already installed"
fi