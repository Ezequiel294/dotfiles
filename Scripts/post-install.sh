#!/bin/bash

# Exit on error and ensure errors in pipelines are caught
set -e
set -o pipefail

# Install packages
echo -e "\nInstalling packages..."
sudo pacman $(cat $HOME/Scripts/pkg.txt) -S --needed --noconfirm

# Install the nix package manager and extra packages
echo -e "\nInstalling nix package manager..."
sudo pacman -S --needed --noconfirm nix
sudo systemctl enable nix-daemon.service
sudo usermod -aG nix-users $USER
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
sudo nix-channel --update
nix-env -iA nixpkgs.ani-cli
nix-env -iA nixpkgs.microsoft-edge-dev
nix-env -iA nixpkgs.pwvucontrol
nix-env -iA nixpkgs.spotify
nix-env -iA nixpkgs.vscode-fhs
nix-env -iA nixpkgs.insync
echo -e "\nNix package manager installed."

# Set environment variables
echo -e "\nSetting environment variables..."
echo "QT_QPA_PLATFORMTHEME=qt6ct" | sudo tee -a /etc/environment
echo 'GTK_THEME="Breeze-Dark"' | sudo tee -a /etc/environment
echo "EDITOR=nvim" | sudo tee -a /etc/environment
echo "VISUAL=nvim" | sudo tee -a /etc/environment
echo "TERM=kitty" | sudo tee -a /etc/environment
echo "Environment variables have been set"

# QEMU setup
echo -e "\nSetting up QEMU..."
echo "Enabling libvirtd service..."
sudo systemctl enable libvirtd
echo "Adding user to the libvirt group..."
sudo usermod -aG libvirt $USER
echo "User has been added to the libvirt group"

# Setting up Git
echo -e "\nSetting up Git..."
read -p "Enter your Git name: " git_name
git config --global user.name "$git_name"
read -p "Enter your Git email: " git_email
git config --global user.email "$git_email"
# Install Git Credential Manager
echo -e "\nInstalling Git Credential Manager..."
cd Repos/
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
cd $HOME
echo "Setting Git built-in cache..."
git config --global credential.credentialStore cache
git config --global credential.cacheOptions "--timeout 1800"
echo "Git Credential Manager has been installed"
echo "Git has been set up"

# Setting up Neovim
echo -e "\nSetting up Neovim..."
cd $HOME/.config
git clone https://github.com/Ezequiel294/nvim
cd
echo "Neovim has been set up"

# Install yarn and neovim npm package
echo -e "\nInstalling yarn and npm neovim packages..."
sudo npm install -g neovim yarn
echo "Yarn has been installed"

# Install bat catppuccin theme
echo -e "\nInstalling bat catppuccin theme..."
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
echo "Bat catppuccin theme has been installed"

# Enable login manager service
echo -e "\nEnabling login manager service..."
sudo systemctl enable ly
echo "Services have been enabled"

echo -e "\nPost-installation complete"
