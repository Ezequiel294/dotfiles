#!/bin/bash

# check if there is an internet connection
if ping -c 1 google.com &> /dev/null; then
    echo "you have an internet connection"
else
    echo "you don't have an internet connection"
    echo "running iwctl..."
    iwctl
fi

# installing arch linux
echo "installing Arch Linux on /mnt"
pacstrap -K /mnt linux linux-firmware base

# generate fstab
echo "generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab

# chroot into the new system
echo "chrooting into the new system..."
arch-chroot /mnt

# set the timezone
echo "setting the timezone..."
echo "please enter your timezone (e.g. America/New_York)"
read timezone
ln -sf /usr/share/zoneinfo/$timezone /etc/localtime
echo "timezone set to $timezone"
hwclock --systohc

# set root password
echo "setting root password..."
passwd

# installing essential packages
pacman -S sudo grub efibootmgr osprober networkmanager base-devel nano neovim git

# create a new user
echo "creating a new user..."
echo "please enter the username of the new user"
read username
useradd -m -G wheel $username
nvim /etc/sudoers
echo "setting password for $username..."
passwd $username

# generate locale
echo "chose your locales"
nvim /etc/locale.gen
echo "generating locale..."
locale-gen
echo "add your locales to /etc/locale.conf"
nvim /etc/locale.conf

# install grub
echo "installing grub..."
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# set hostname
echo "please enter your hostname"
read hostname
echo $hostname > /etc/hostname

# network configuration
echo "configure your network"
nvim /etc/hosts
echo "enabling NetworkManager..."
systemctl enable NetworkManager

# exit chroot
exit

# shutdown
echo "installation complete"
echo "do you want to shutdown now? (y/n)"
read response
if [ $response == "y" ]; then
    echo "shutting down..."
    shutdown now
fi
