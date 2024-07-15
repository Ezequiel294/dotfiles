#!/bin/bash

rm $HOME/Scripts/Arch/pkg.txt
pacman -Qqe | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/Arch/pkg.txt
