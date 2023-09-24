#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install packages from .pkg file
cat .pkg.txt | xargs sudo pacman -S --needed
