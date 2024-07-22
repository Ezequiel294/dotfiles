# Fedora

![Desktop](https://github.com/Ezequiel294/dotfiles/assets/119618678/2427d392-036e-4553-be12-222d1ccae3e2)

Go to Fedora's website and install the KDE edition

# Arch

![setup](https://github.com/user-attachments/assets/a59c90de-5377-46a1-b529-677117f6b3d5)

# Index

- [Overview](#overview)
- [Requirements](#list-of-requirements)
- [Arch Installation](#arch-installation)
- [FAQ](#faq)

# Overview

The following instructions are a guide to installing and configuring Arch. Before following these instructions, it is necessary to know Linux-based operating systems and command line interfaces.

> [!NOTE]
> - Arch Linux installation images do not support Secure Boot. You will need to disable Secure Boot to boot the installation medium.
> - Code examples may contain placeholders that must be replaced manually. 

# List of Requirements
- Internet connection
- 64-bit computer Using UEFI
- Keyboard and Mouse
- At least 2GB of available RAM Memory
- At least 16GB of available storage

# Arch Installation

1. Download the Arch ISO and burn it to a USB memory:
- [Arch ISO](https://archlinux.org/download/)

2. Boot to the USB memory

3. Select the first boot option with the "Enter" key

> [!NOTE]
> I recommend opening the official guide to follow along in case something changes or you have a different need.
> - [Arch Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

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

7. Format the partitions with the following commands
```bash
mkfs.vfat -F32 /dev/partion
mkfs.ext4 /dev/partition
mkswap /dev/partition
```
> [!NOTE]
> Use vfat for the EFI partition and ext4 for the root

8. Mount the partitions
> [!NOTE]
> Root partition should be mounted to /mnt
```bash
mount /dev/partition /mnt
mount /dev/partition /mnt/boot
```

9. Check you have internet
```bash
ping google.com
```
If not, use the "iw" tool with the following command
```bash
iwctl
```

10. Install kernel and base package
```bash
pacstrap -K /mnt linux linux-firmware base git
```

11. Generate the fstab file
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

12. Change root to your system
```bash
arch-chroot /mnt
```

13. Move to the root directory
```bash
cd /root
```

14. Clone my arch base installation script
```bash
git clone https://github.com/Ezequiel294/arch-install
```

15. Move back to root
```bash
cd /
```

16. Run my script
```bash
bash /root/base-install.sh
```

17. Exit your system
```bash
exit
```
18. Shutdown your computer
```bash
shutdown now
```

19. When powered off, remove the USB memory

20. Power your computer back on

21. Select the first boot option in Grub

22. Login with your user

23. Run my post-installation script
```bash
bash Scripts/Arch/post-install.sh
```

24. Restart your computer
```bash
reboot
```

# FAQ

To update the pkg.txt file with all the packages installed in your system
```bash
bash $HOME/Scripts/Arch/update_pkg.sh
```

To push the modification, you have to use dotfiles instead of git.
```bash
dotfiles push
```
