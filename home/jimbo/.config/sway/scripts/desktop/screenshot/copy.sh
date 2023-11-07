#!/usr/bin/env bash
 
# Create an imv window to act as a static screen
grim -t ppm - | imv_config=~/.config/imv/screenshot.ini imv - &
imv_pid=$!
 
# Capture the screenshot of the selected area and save to a temporary file
selected_area=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'\
| XCURSOR_SIZE=40 slurp -w 3 -c ${primecol#*#} -B 00000066 -b 00000099)
temp_file=$(mktemp -u).png
grim -g "$selected_area" "$temp_file"

# Kill the imv window
kill $imv_pid

# Copy the screenshot to the clipboard
wl-copy < "$temp_file" && notify-send -i "$temp_file" "Screenshot copied."

# Clean up the temporary file
rm "$temp_file"
