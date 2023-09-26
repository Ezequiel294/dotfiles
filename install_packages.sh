#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install packages from .pkg file
cat .pkg | xargs sudo pacman -S --needed --noconfirm

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install The remainding packages that are only available in the AUR
sudo yay -S pamac-all sardi-icons visual-studio-code-bin nvim-packer-git

# Change shell to fish
chsh
# Fish route /usr/bin/fish

reboot
