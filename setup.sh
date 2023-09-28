#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install yay
if ! pacman -Qi paru &> /dev/null; then
    git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd
else
    echo "You already have paru installed."
fi

# Install packages from .pkg file
cat .pkg | xargs paru -S --needed --noconfirm

# Change shell to fish
# Fish route /usr/bin/fish
if [[ "$SHELL" != *fish* ]]; then
    chsh
else
    echo "You already have fish as your shell."
fi

# Set a wallpaper
nitrogen --set-zoom-fill $HOME/.wallpapers/arco-wallpaper.jpg

# Ask to reboot the system
read -p "Do you want to reboot the PC? (y/n): " choice
case "$choice" in
  y|Y ) echo "Rebooting..."; reboot;;
  n|N ) echo "You can reboot manually later.";;
  * ) echo "Invalid input. Please reboot manually";;
esac
