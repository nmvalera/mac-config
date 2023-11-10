#! /usr/bin/env bash

# Install Shell assuming iTerm2 and zsh have been installed in previous steps

# Set iTerm2 settings
echo "Downloading iTerm2 profile..."
iterm2_profile_url="https://raw.githubusercontent.com/nmvalera/mac-config/main/config/shell/nmvalera.iterm2.json"
iterm2_profile_dir="$HOME/Library/Application Support/iTerm2/DynamicProfiles/nmvalera.iterm2.json"
wget -O "$iterm2_profile_dir" "$iterm2_profile_url"

echo "Setting iTerm2 settings..."
printf "%s\n" "iTerm2 - Don’t display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

printf "%s\n" "iTerm2 - Select the “Compact” appearance in Preferences > General > Appearance"
defaults write com.googlecode.iterm2 UseCompactAppearance -bool true

printf "%s\n" "iTerm2 - Set profile to use custom color preset from URL"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool false

printf "%s\n" "iTerm2 - Set default profile to use custom color preset"
defaults write com.googlecode.iterm2 DefaultProfile -string "nmvalera"
defaults write com.googlecode.iterm2 "Default Bookmark Guid" "169506F4-2F8E-4ED4-A857-A1FB7E111F48"

# Install Oh My Zsh
# Test if Oh My Zsh is installed and install it if it is not or print already installed message if it is
if test ! -d "$HOME/.oh-my-zsh"; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed"
fi

# Install Powerlevel10k theme
# Test if Powerlevel10k theme is installed and install it if it is not or print already installed message if it is
if test ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  
  # Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
  sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
else
  echo "Powerlevel10k theme already installed"
fi

# Download MesloLGS NF font
download_font() {
    declare -A fonts=(
        ["https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"]="MesloLGS NF Regular.ttf"
        ["https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"]="MesloLGS NF Bold.ttf"
        ["https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"]="MesloLGS NF Italic.ttf"
        ["https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"]="MesloLGS NF Bold Italic.ttf"
    )

    for url in "${!fonts[@]}"; do
        font="${fonts[$url]}"
        font_path="$HOME/Library/Fonts/$font"
        if test ! -f "$font_path"; then
            echo "Downloading $font..."
            # sudo touch "$font_path"
            sudo wget -O "$font_path" "$url"
        else
            echo "$font already downloaded"
        fi
    done
}

# Not needed on latest installation
# download_font

# Install zsh pluggins
echo "Installing zsh plugins..."

declare -a plugins=(
    docker
    docker-compose
    git
    terraform
)

declare -A custom_plugins=(
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions.git"
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  # ["zsh-completions"]="https://github.com/zsh-users/zsh-completions.git"
  # ["zsh-autocomplete"]="https://github.com/marlonrichert/zsh-autocomplete.git"
  # Add more here...
)

# Clone zsh custom plugins 
clone_zsh_custom_plugins() {
  echo "Cloning zsh custom plugins..."

  for plugin in "${!custom_plugins[@]}"; do
    plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
    if test ! -d "$plugins_dir/$plugin"; then
      echo "Cloning $plugin..."
      git clone "${custom_plugins[$plugin]}" "$plugins_dir"
    else
      echo "$plugin already cloned"
    fi
    plugins+=("$plugin")
  done
}

clone_zsh_custom_plugins

# Set zsh plugins in ~/.zshrc
set_zshrc_plugins() {
  local plugins_str="${plugins[*]}"
  sed -i '' "s/plugins=(.*)/plugins=($plugins_str)/" ~/.zshrc
}

set_zshrc_plugins

