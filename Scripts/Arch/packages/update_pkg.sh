#!/bin/bash

rm $HOME/Scripts/Arch/packages/pkg.txt
pacman -Qq | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/Arch/packages/pkg.txt
