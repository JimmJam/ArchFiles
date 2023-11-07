#!/usr/bin/env bash

# Run makoctl mode and store the output in a variable
mode_output=$(makoctl mode)

# Extract the second line after "default"
mode_line=$(echo "$mode_output" | sed -n '/default/{n;p}')

if [[ "$mode_line" == "do-not-disturb" ]]; then
  # Notifications are disabled, so we enable them
  makoctl mode -r do-not-disturb
  notify-send 'Notifications Enabled' --expire-time=1500
else
  # Notifications are enabled, so we disable them
  notify-send 'Notifications Disabled' --expire-time=1500
  sleep 2
  makoctl mode -a do-not-disturb
fi
