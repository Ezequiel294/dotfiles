#!/bin/bash

rm $HOME/Scripts/pkg.txt
pacman -Qqe | grep -v -e 'intel-ucode' -e 'amd-ucode' -e 'paru' | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/pkg.txt
