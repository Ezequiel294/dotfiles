# Index

- [Overview](#overview)
- [List of Requirements](#list-of-requirements)
- [Sway installation and configuration](#sway-installation-and-configuration)
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

1. Follow the instructions in the README.md file in my other repository [Arch-Installation](https://github.com/Ezequiel294/arch-install)

# Sway installation and configuration

1. After installing Arch, run my post-installation script
```bash
bash $HOME/Scripts/post-install.sh
```

2. Restart your computer
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
