#!/bin/bash

# Exit on error and ensure errors in pipelines are caught
set -e
set -o pipefail

# Install paru
echo -e "\nInstalling paru..."
cd $HOME
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
echo "Paru has been installed"

# Install packages
echo -e "\nInstalling packages..."
cat $HOME/Scripts/pkg.txt | xargs paru -S --needed --noconfirm

# Adding user to the libvirt group
echo -e "\nAdding user to the libvirt group..."
sudo usermod -aG libvirt $USER
echo "User has been added to the libvirt group"

# Install yarn and neovim npm package
echo -e "\nInstalling yarn and npm neovim packages..."
sudo npm install -g neovim yarn
echo "Yarn has been installed"

# Install bat catppuccin theme
echo -e "\nInstalling bat catppuccin theme..."
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
echo "Bat catppuccin theme has been installed"

# Enable ly service
echo -e "\nEnabling services..."
sudo systemctl enable libvirtd
sudo systemctl enable ly
echo "Services have been enabled"

echo -e "\nPost-installation complete"
