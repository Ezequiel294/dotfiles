#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install yay
if ! pacman -Qi yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

# Install packages from .pkg file
cat .pkg | xargs yay -S --needed --noconfirm

# Change shell to fish
# Fish route /usr/bin/fish
if [[ "$SHELL" != *fish* ]]; then
    chsh
fi

# Ask to reboot the system
read -p "Do you want to reboot the PC? (y/n): " choice
case "$choice" in
  y|Y ) echo "Rebooting..."; reboot;;
  n|N ) echo "You can reboot manually later.";;
  * ) echo "Invalid input. Please enter y or n.";;
esac
