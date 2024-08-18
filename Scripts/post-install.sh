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

# Set environment variables
echo -e "\nSetting environment variables..."
echo "QT_QPA_PLATFORMTHEME=qt6ct" | sudo tee -a /etc/environment
echo 'GTK_THEME="Breeze-Dark"' | sudo tee -a /etc/environment
echo "EDITOR=nvim" | sudo tee -a /etc/environment
echo "VISUAL=nvim" | sudo tee -a /etc/environment
echo "TERM=kitty" | sudo tee -a /etc/environment
echo "Environment variables have been set"

# Adding user to the libvirt group
echo -e "\nAdding user to the libvirt group..."
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
cd Repos
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
cd
echo "Setting Git built-in cache..."
git config --global credential.credentialStore cache
git config --global credential.cacheOptions "--timeout 1800"
echo "Git Credential Manager has been installed"
echo "Git has been set up"

# Install yarn and neovim npm package
echo -e "\nInstalling yarn and npm neovim packages..."
sudo npm install -g neovim yarn
echo "Yarn has been installed"

# Install bat catppuccin theme
echo -e "\nInstalling bat catppuccin theme..."
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
echo "Bat catppuccin theme has been installed"

# Enable services
echo -e "\nEnabling services..."
sudo systemctl enable libvirtd
sudo systemctl enable ly
echo "Services have been enabled"

echo -e "\nPost-installation complete"
