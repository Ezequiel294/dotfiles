#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install packages from .pkg file
cat .pkg | xargs yay -S --needed --noconfirm

# Change shell to fish
# Fish route /usr/bin/fish
chsh

reboot
