# Sway

![Desktop](https://github.com/user-attachments/assets/dd87aaa7-8afc-4bcf-8cfb-4363e015d20e)
![Dev](https://github.com/user-attachments/assets/168839ef-0f31-4617-bfa8-5d726044d565)
![Terminal](https://github.com/user-attachments/assets/9eb456b9-4ed2-4620-a7cf-bb892715f314)

# Index

- [Sway](#sway)
- [Index](#index)
- [Overview](#overview)
- [List of Requirements](#list-of-requirements)
- [Arch Installation](#arch-installation)
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
sh $HOME/Scripts/post-install.sh | tee -a $HOME/Scripts/logs/post-install.log
```

2. Restart your computer
```bash
reboot
```

# FAQ

To update the pkg.txt file with all the packages installed in your system
```bash
sh $HOME/Scripts/Arch/update_pkg.sh
```

To push the modification, you have to use dotfiles instead of git.
```bash
dotfiles push
```
