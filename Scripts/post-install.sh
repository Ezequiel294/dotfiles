#!/bin/bash

# Exit on error and ensure errors in pipelines are caught
set -e
set -o pipefail

# User questions
echo -e "\n"
read -p "Enter your Git name: " git_name
read -p "Enter your Git email: " git_email

# Install packages
echo -e "\nInstalling packages..."
sudo pacman $(cat $HOME/Scripts/pkg.txt) -S --needed --noconfirm

# Install the nix package manager and extra packages
echo -e "\nConfiguring Nix package manager"
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
sudo nix-channel --update
nix-env -iA nixpkgs.ani-cli
nix-env -iA nixpkgs.pwvucontrol
nix-env -iA nixpkgs.spotify
nix-env -iA nixpkgs.dropbox
nix-env -iA nixpkgs.insync
echo -e "Nix package manager configured.\n"

# QEMU setup
echo -e "\nSetting up QEMU..."
echo "Enabling libvirtd service..."
sudo systemctl enable libvirtd
echo "Adding user to the libvirt group..."
sudo usermod -aG libvirt $USER
echo -e "User has been added to the libvirt group\n"

# Setting up Git
echo -e "\nSetting up Git..."
git config --global user.name "$git_name"
git config --global user.email "$git_email"
# Install Git Credential Manager
echo -e "\nInstalling Git Credential Manager..."
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
echo "Setting Git built-in cache..."
git config --global credential.credentialStore cache
git config --global credential.cacheOptions "--timeout 1800"
echo "Git Credential Manager has been installed"
echo -e "Git has been set up\n"

# Setting up Neovim
echo -e "\nSetting up Neovim..."
cd $HOME/.config
git clone https://github.com/Ezequiel294/nvim
cd
echo -e "Neovim has been set up\n"

# Install yarn and neovim npm package
echo -e "\nInstalling yarn and npm neovim packages..."
sudo npm install -g neovim yarn
echo -e "Yarn and Neovim npm packages have been installed\n"

# Install bat catppuccin theme
echo -e "\nInstalling bat catppuccin theme..."
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
echo -e "Bat catppuccin theme has been installed\n"

# Enable login manager service
echo -e "\nEnabling login manager service..."
sudo systemctl enable ly
echo -e "Services have been enabled\n"

fastfetch

echo -e "\nPost-installation complete"
