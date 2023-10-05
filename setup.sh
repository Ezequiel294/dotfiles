#!/bin/bash

# Create home directories
cd && mkdir Downloads Documents Pictures Videos Repos

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install paru
if ! pacman -Qi paru & > /dev/null; then
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

# Rofi theme
if ! [ -d "$HOME/Repos/rofi-themes" ]; then
    cd $HOME/Repos && git clone https://github.com/davatorium/rofi-themes.git && sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes
else
    echo "rofi-themes are already installed."
fi

# Ranger icons
if ! [ -d "$HOME/.config/ranger/plugins" ]; then
    bash $HOME/.config/ranger/install-plugs.sh
else
    echo "Ranger icons are already installed"
fi

# Ask to reboot the system
read -p "Do you want to reboot the PC? (y/n): " choice
case "$choice" in
  y|Y ) echo "Rebooting..."; reboot;;
  n|N ) echo "You can reboot manually later.";;
  * ) echo "Invalid input. Please reboot manually";;
esac
