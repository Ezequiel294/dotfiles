#!/bin/bash

rm $HOME/Scripts/packages/pkg.txt
pacman -Qqe | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/packages/pkg.txt
