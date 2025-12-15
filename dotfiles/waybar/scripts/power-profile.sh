#!/bin/bash

# Get the current power profile and display only the last line
#profile=$(asusctl profile -p | tail -n 1)
profile=$(asusctl profile -p | tail -n 1 | sed 's/^Active profile is //')

# Print the profile for Waybar to display
echo "$profile"
