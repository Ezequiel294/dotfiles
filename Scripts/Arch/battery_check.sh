#!/bin/bash

# Get battery level
battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Check if battery level is less than or equal to 10%
if [ "$battery_level" -le 10 ]; then
    notify-send "Low Battery ${battery_level}"
fi

