#! /usr/bin/env bash

# Install Homebrew Formulae
install_formula() {
  package=$1
  if test ! $(brew list | grep -w "$package"); then
    echo "Installing $package..."
    brew install $package
  else
    echo "$package already installed"
  fi
}

install_formula "1password-cli"
install_formula "asciinema"
install_formula "bash"
install_formula "bash-completion"
install_formula "coreutils"
install_formula "docker"
install_formula "docker-compose"
install_formula "git"
install_formula "gh"
install_formula "go"
install_formula "gpg"
install_formula "htop"
install_formula "jq"
install_formula "openssh"
install_formula "openssl"
install_formula "postgresql"
install_formula "pyenv"
install_formula "python"
install_formula "terraform"
install_formula "vim"
install_formula "wget"
install_formula "yarn"
install_formula "zsh"
install_formula "zsh-git-prompt"
install_formula "zsh-history-substring-search"
install_formula "zsh-lovers"
install_formula "zsh-navigation-tools"
install_formula "zsh-syntax-highlighting"
install_formula "zshdb"
