# Index

- [Overview](#overview)
- [Requirements](#list-of-requirements)
- [Arch Installation](#arch-installation)
- [Configuration](#configuration)

# Overview

The following instructions are a guide to installing and configuring Arch. It is necessary to know Linux-based operating systems, virtual machines, and command line interfaces before following these instructions.

# List of Requirements
- Internet connection
- 64-bit computer Using UEFI
- Keyboard and Mouse
- At least 2GB of available RAM Memory
- At least 15GB of available storage

# Arch Installation

1. Download the Arch ISO and burn it to a USB memory:
- [Arch ISO](https://archlinux.org/download/)

2. Boot to the USB memory

3. Select the first boot option

Now we can start with the Arch Installation; I recommend opening the official guide to help.
- [Arch Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

4. Change the terminal font if it is too small
```bash
setfont ter-132b
```

5. Display block devices
```bash
lsblk
```

6. Make the disk partitions
```bash
cfdisk
```

7. Format the partitions with the following command
```bash
mkfs.format --options /dev/partition
```

8. Mount the partitions (root partition should be mounted to /mnt)
```bash
mount --otions /devpartition route
```

9. Check you have internet
```bash
ping google.com
```
If not, use command
```bash
iwctl
```

10. Install kernel and base package
```bash
pacstrap -K /mnt linux linux-firmware base
```

11. Generate the fstab file
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

12. Change root to your system
```bash
arch-chroot /mnt
```

13. Set the time zone
```bash
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

14. Run hwclock to generate /etc/adjtime
```bash
hwclock --systohc
```

15. Set the root user password
```bash
passwd
```

16. Create your user
```bash
useradd -m -G wheel username
```

17. Create a password for your user
```bash
passwd username
```

18. Install essential packages
```bash
pacman -S base-devel grub efibootmgr os-prober intel-ucode nvidia mesa vulkan-intel networkmanager sudo alacritty git neovim
```

19. Uncoment the following line in /etc/sudoers to make users in the wheel group use sudo
```bash
# %wheel ALL=(ALL) ALL
```

20. Uncoment in /etc/locale.gen the locales you want to have
```bash
#en_US.UTF-8 UTF-8
```

21. Generate the locales
```bash
locale-gen
```

22. Create the locale.conf file
```bash
touch /etc/locale.conf
```

23. Ser the language
LANG=en_US.UTF-8

24. Install grub
```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

25. Make the grub configuration
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

26. Set a hostname
```bash
echo "hostname" > /etc/hostname
```

27. Make network configuration by editing your /etc/hosts file. A basic setup is<br>
> 127.0.0.1    localhost<br>
> ::1          localhost<br>
> 127.0.0.1    *hostname*.localhost *hostname*

28. Enable networkmanager
```bash
systemctl enable NetworkManager
```

29. Exit your system
```bash
exit
```
30. Shutdown your computer
```bash
shutdown now
```

31. Remove the USB memory

32. Power your computer

33. Enter your UEFI configuration

34. Change the boot order to have the disk with Arch Linux first

35. Select the first boot option in Grub

36. Log in with your user

37. Install KDE Plasma desktop envirorment
```bash
sudo pacman -S plasma-meta
```

38. Enable the login manager
```bash
sudo systemctl enable sddm
```

39. Restart your computer
```bash
reboot
```

# Configuration

40. Clone this repo in your user directory
```bash
git clone --bare https://github.com/Ezequiel294/dotfiles .dotfiles
```

41. Execute the following command.
```bash
git --git-dir $HOME/.dotfiles/ --work-tree $HOME checkout --force
```

42. Install an AUR helper
```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

42. Install the rest of my packages
```bash
cat pkg.txt | xargs paru -S --needed
```

To update the pkg.txt file with all the packages installed in your system, you have to remove the pkg.txt file and regenerate it
```bash
rm pkg.txt
pacman -Qqe | tr '\n' ' ' | sed 's/.$//' > pkg.txt
```

To push the modification, you have to use dotfiles instead of git.
```bash
dotfiles push -u origin main
```