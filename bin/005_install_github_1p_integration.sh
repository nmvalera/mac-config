#! /usr/bin/env bash

check_1p_cli_integration_enabled() {
  if gtimeout 3 bash -c "op signin --raw > /dev/null 2>&1"; then
    echo "1Password CLI integration is enabled"
  else
    echo "\n\n\033[0;31m1Password CLI integration is not enabled. Please enable it in 1Password Desktop app under Settings > Developer (c.f. https://developer.1password.com/docs/cli/get-started/#step-2-turn-on-the-1password-desktop-app-integration). Then re-run this script.\033[0m"
    exit 1
  fi
}

check_1p_cli_integration_enabled

# Check if Github SSH key exists in 1Password vault and if not create it under Personal Vault
declare ssh_key_title="GitHub SSH Key 1Password"
declare vault="Personal"

if op item get --vault "$vault" "${ssh_key_title}" > /dev/null 2>&1; then
  echo "\"$ssh_key_title\" already exists in 1Password vault \"$vault\""
else
  echo "Creating \"$ssh_key_title\" in 1Password vault \"$vault\"..."
  op item create \
    --title "$ssh_key_title" \
    --vault "$vault" \
    --category ssh
fi

# Verifies 1Password SSH Agent is enabled

# Set IdentityAgent in .ssh/config
config_file="$HOME/.ssh/config"

# Create SSH file if it does not exist
if [ ! -f "$config_file" ]; then
  touch "$config_file"
fi

# Add IdentityAgent to .ssh/config if it does not exist
if grep -q "Host *\n\tIdentityAgent" $config_file; then
  echo "IdentityAgent in $config_file already set"
else
  identity_agent="~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  echo "Set IdentityAgent in $config_file"
  echo -e "Host *\n\tIdentityAgent \"$identity_agent\"" >> $config_file
fi
