#!/bin/bash

# Clean journalctl logs
echo -e "\nCleaning journalctl logs..."
sudo journalctl -p 3 -xb --vacuum-time=7d

# Run paccache -d to show available removal space
echo -e "\nRunning paccache"
paccache -r

# Yay cleaning
echo -e "\nRunning yay -clean"
yay -clean

# Calculate the size of the .cache directory
cache_size=$(du -sh ~/.cache 2>/dev/null | awk '{print $1}')
echo -e "\nThe .cache directory is currently using $cache_size of space."
# Warn about files larger than 100MB
large_files_found=$(find ~/.cache -type f -size +100M 2>/dev/null)
if [[ -n $large_files_found ]]; then
    echo "Warning: There are files larger than 100MB in your .cache directory."
    echo "Largest files in the .cache directory:"
    find ~/.cache -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 5
fi
# Prompt user for cleaning the .cache directory
read -p "Do you want to clean the .cache directory? [Y/n]: " response
if [[ -z "${response}" || "${response}" =~ ^[Yy]$ ]]; then
    rm -rf ~/.cache/*
    echo ".cache directory cleaned."
else
    echo "cleaning .cache directory aborted."
fi

echo -e "\nclean.sh script finished.\n"
