#!/bin/bash

cat $HOME/Scripts/Arch/packages/pkg.txt | xargs paru -S --needed --noconfirm
