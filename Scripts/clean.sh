#!/bin/bash

# Run paccache -d to show available removal space
paccache -d

# Ask the user if they want to continue with the cleaning
read -p "Do you want to continue with cleaning? (y/n): " choice
if [[ $choice == "y" ]]; then
    echo "Cleaning..."
    paccache -r
    echo "Cleaning completed."
else
    echo "Cleaning aborted."
fi