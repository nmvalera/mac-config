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

install_go() {
  install_formula "go"

  # Add Go to PATH
  echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.zshenv
}


install_terrafom() {
  brew tap hashicorp/tap
  install_formula "hashicorp/tap/terraform"
}

install_smithy() {
    brew tap smithy-lang/tap
    install_formula "smithy-cli"
}

install_formula "1password-cli"
install_formula "android-platform-tools"
install_formula "asciinema"
install_formula "awscli"
install_formula "bash"
install_formula "bash-completion"
install_formula "coreutils"
install_formula "docker"
install_formula "docker-compose"
install_formula "git"
install_formula "gitmoji"
install_formula "gh"
install_formula "go"
install_formula "golangci-lint"
install_formula "gomplate"
install_formula "google-cloud-sdk"
install_formula "goreleaser"
install_formula "gpg"
install_formula "graphviz"
install_formula "htop"
install_formula "ipcalc"
install_formula "jq"
install_formula "just"
install_formula "kubebuilder"
install_formula "mitmproxy"
install_formula "mockery"
install_formula "moreutils"
install_formula "ollama"
install_formula "openssh"
install_formula "openssl"
install_formula "postgresql"
install_formula "protobuf"
install_formula "pyenv"
install_formula "python"
install_formula "repo-prompt"
install_smithy
install_terrafom
install_formula "terraform-docs"
install_formula "terragrunt"
install_formula "tflint"
install_formula "thunderbird"
install_formula "tree"
install_formula "trivy"
install_formula "tunnelblick"
install_formula "uv"
install_formula "vim"
install_formula "weasyprint"
install_formula "wget"
install_formula "yarn"
install_formula "ytt"
install_formula "zsh"
install_formula "zsh-git-prompt"
install_formula "zsh-history-substring-search"
install_formula "zsh-lovers"
install_formula "zsh-navigation-tools"
install_formula "zsh-syntax-highlighting"
install_formula "zshdb"


