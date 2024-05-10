#!/bin/bash

pacman -Qqe | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/packages/pkg.txt
