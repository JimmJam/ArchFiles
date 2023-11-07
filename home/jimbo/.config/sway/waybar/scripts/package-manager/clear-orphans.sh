#!/usr/bin/env bash
echo "Clearing orphaned packages"

# Check for yay and run the command
if command -v yay &> /dev/null; then
  yay -Yc
elif command -v emerge &> /dev/null; then
  sudo emerge --depclean
elif command -v apt &> /dev/null; then
  sudo apt autoremove
else
  echo "Neither Yay, Emerge, or Apt package managers found."
fi
