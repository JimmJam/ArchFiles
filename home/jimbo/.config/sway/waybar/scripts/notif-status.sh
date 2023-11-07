#!/usr/bin/env bash

# Run makoctl mode and store the output in a variable
mode_output=$(makoctl mode)

# Extract the second line after "default"
mode_line=$(echo "$mode_output" | sed -n '/default/{n;p}')

if [[ "$mode_line" == "do-not-disturb" ]]; then
  printf '{"text":"󱆥  Off","class":"disabled","tooltip":"Notifications Disabled."}'
else
  printf '{"text":"  On","tooltip":"Notifications Enabled."}';
fi
