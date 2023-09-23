#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install packages from .pkg file
cat .pkg | xargs sudo pacman -S --needed
