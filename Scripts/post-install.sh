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
cat $HOME/Scripts/Arch/pkg.txt | xargs paru -S --needed --noconfirm

# Install ranger icons
echo "Installing ranger icons"
bash $HOME/.config/ranger/install-plugs.sh
echo "Ranger icons installed"

# Install yarn and neovim npm package
echo "Installing yarn..."
sudo npm install -g neovim yarn
echo "Yarn has been installed"

# Enable ly service
echo "Enabling ly service..."
sudo systemctl enable ly
echo "ly service enabled"

echo "Post-installation complete"
