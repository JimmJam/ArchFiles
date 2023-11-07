#!/usr/bin/env bash
selected_window=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | "\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)"' | slurp -r -c 8800FF -B 00000066 -b 00000000)
if [ -n "$selected_window" ]; then
  app_id=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | select("\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)" == "'"$selected_window"'") | .app_id')
  shell=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | select("\(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)" == "'"$selected_window"'") | .shell')
  
  notify-send "Window's app_id: $app_id"
  notify-send "Window's shell: $shell"
fi
