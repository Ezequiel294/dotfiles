#!/bin/bash

rm $HOME/Scripts/pkg.txt
pacman -Qqe | grep -v -e 'intel-ucode' -e 'amd-ucode' -e 'qemu-guest-agent' -e 'virtualbox-guest-utils' -e 'nvidia' -e 'radeon' -e 'vulkan' -e 'yay' | tr '\n' ' ' | sed 's/.$//' >$HOME/Scripts/pkg.txt
