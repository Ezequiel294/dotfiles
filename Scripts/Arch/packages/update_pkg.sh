#!/bin/bash

rm $HOME/Scripts/Arch/packages/pkg.txt
pacman -Qqe | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/Arch/packages/pkg.txt
