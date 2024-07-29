#!/bin/bash

rm $HOME/Scripts/Arch/pkg.txt
pacman -Qqe | grep -v -e 'intel-ucode' -e 'amd-ucode' -e 'paru' | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/Arch/pkg.txt
