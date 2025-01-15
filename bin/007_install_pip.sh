#! /usr/env/bin bash

install_package() {
    package=$1
    if test ! $(command -v $package); then
        echo "Installing $package..."
        pip install $package
    else
        echo "$package already installed"
    fi
}

# Updgrade pip  
pip install --upgrade pip

# Install pip packages
install_package "pre-commit"