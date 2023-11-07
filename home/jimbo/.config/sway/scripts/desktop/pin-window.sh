#!/usr/bin/env bash

# Get the current border style of the focused window
current_style=$(swaymsg -t get_tree | jq -r '.. | select(.focused?).border')

# Toggle between "normal" (default) and "pixel 2" border styles
if [ "$current_style" == "none" ]; then
  swaymsg "sticky disable, border pixel 2"
else
  swaymsg "sticky enable, border none"
fi
