#!/bin/bash

rm $HOME/Scripts/Fedora/pkg.txt
sudo dnf list installed | sed 's/ .*$//' | tr '\n' ' ' | sed -E 's/^[^ ]+ //' > $HOME/Scripts/Fedora/pkg.txt
