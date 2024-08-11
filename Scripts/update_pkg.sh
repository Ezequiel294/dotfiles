#!/bin/bash

rm $HOME/Scripts/pkg.txt
pacman -Qqe | grep -v -e 'intel-ucode' -e 'amd-ucode' -e 'paru' -e 'qemu-guest-agent' -e 'virtualbox-guest-utils' -e 'nvidia' -e 'radeon' -e 'vulkan' | tr '\n' ' ' | sed 's/.$//' >$HOME/Scripts/pkg.txt
