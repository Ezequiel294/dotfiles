#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install paru
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

# Rofi theme
if ! [ -d "$HOME/Repositories" ]; then
    mkdir $HOME/Repositories && cd $HOME/Repositories && git clone https://github.com/davatorium/rofi-themes.git && sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes
else
    if ! [ -d "$HOME/Repositories/rofi-themes" ]; then
        cd $HOME/Repositories && git clone https://github.com/davatorium/rofi-themes.git && sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes
    else
        echo "rofi-themes are already installed."
    fi
fi

# Ask to reboot the system
read -p "Do you want to reboot the PC? (y/n): " choice
case "$choice" in
  y|Y ) echo "Rebooting..."; reboot;;
  n|N ) echo "You can reboot manually later.";;
  * ) echo "Invalid input. Please reboot manually";;
esac
