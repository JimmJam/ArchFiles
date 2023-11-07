#!/usr/bin/env bash

# Take a screenshot and save it to the temporary file
temp_file=$(mktemp -u).png
grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') "$temp_file"

# Check if the screenshot was successfully taken
if [ $? -eq 0 ]; then
  # Copy the screenshot to the clipboard
  wl-copy < "$temp_file"
  
  # Show a notification with the screenshot
  notify-send -i "$temp_file" "Current screen copied."

  # Remove the temporary file
  rm "$temp_file"
else
  # If the screenshot capture failed, show an error notification
  notify-send "Error: Unable to capture screenshot."
fi
