#!/bin/bash

# Ensure the system is up-to-date
sudo pacman -Syu --noconfirm

# Install paru
if ! pacman -Qi paru & > /dev/null; then
    cd $HOME/Repos/Utilities && git clone https://aur.archlinux.org/paru.git && cd $HOME/Repos/Utilities/paru && makepkg -si && cd
else
    echo "You already have paru installed."
fi

# Install packages from .pkg file
cat .pkg | xargs paru -S --needed --noconfirm --quiet

# Change shell to fish
if [[ "$SHELL" != *fish* ]]; then
    chsh -s /usr/bin/fish
else
    echo "You already have fish as your shell."
fi

# SDDM autologin
if ! [ -e /etc/sddm.conf.d/autologin.conf ]; then
    read -p "Do you want to enable autologin? (y/n): " autologin_choice
    if [[ $autologin_choice == "y" ]]; then
        sudo mkdir /etc/sddm.conf.d
        sudo touch /etc/sddm.conf.d/autologin.conf
        read -p "Enter the username: " user
        read -p "Enter the session: " session
        autologin_config="[Autologin]\nUser=$user\nSession=$session"
        echo -e "$autologin_config" | sudo tee /etc/sddm.conf.d/autologin.conf > /dev/null
        echo "Autologin configuration has been saved to /etc/sddm.conf.d/autologin.conf"
    else
        echo "Autologin is not enabled."
    fi
else
    echo "Autologin is already set up."
fi

# Rofi theme
if ! [ -d "$HOME/Repos/rofi-themes" ]; then
    cd $HOME/Repos/Utilities && git clone https://github.com/davatorium/rofi-themes.git && sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes
    sudo sed -i '29d' /usr/share/rofi/themes/onedark.rasi
    sudo sed -i '84,87d' /usr/share/rofi/themes/onedark.rasi
else
    echo "rofi-themes are already installed."
fi

# Ranger icons
if ! [ -d "$HOME/.config/ranger/plugins" ]; then
    bash $HOME/.config/ranger/install-plugs.sh
else
    echo "Ranger icons are already installed"
fi

# Nodejs package for neovim
cd && npm install neovim

# Ask to reboot the system
read -p "Do you want to reboot the PC? (y/n): " choice
case "$choice" in
  y|Y ) echo "Rebooting..."; reboot;;
  n|N ) echo "You can reboot manually later.";;
  * ) echo "Invalid input. Please reboot manually";;
esac
