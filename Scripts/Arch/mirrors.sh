#!/bin/bash

sudo reflector --verbose --latest 25 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy