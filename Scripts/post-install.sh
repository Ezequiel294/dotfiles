#!/bin/bash

# Exit on error and ensure errors in pipelines are caught
set -e
set -o pipefail

# Install paru
echo "Installing paru..."
cd $HOME
git clone https://aur.archlinux.org/paru.git .paru
cd .paru
makepkg -si
echo "Paru has been installed"

# Install packages
echo "Installing packages..."
cat $HOME/Scripts/pkg.txt | xargs paru -S --needed --noconfirm

# Install yarn and neovim npm package
echo "Installing yarn and npm neovim packages..."
sudo npm install -g neovim yarn
echo "Yarn has been installed"

# Install bat catppuccin theme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build

# Enable ly service
echo "Enabling ly service..."
sudo systemctl enable ly
echo "ly service enabled"

echo "Post-installation complete"
