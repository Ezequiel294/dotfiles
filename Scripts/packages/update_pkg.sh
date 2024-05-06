#!/bin/bash

pacman -Qq | tr '\n' ' ' | sed 's/.$//' > $HOME/Scripts/packages/pkg.txt