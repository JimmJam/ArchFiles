#!/usr/bin/env bash
echo "Removing cached packages"

# Check for yay and run the command
if command -v yay &> /dev/null; then
  yes | yay -Scc
elif command -v emerge &> /dev/null; then
  sudo eclean-dist --deep
elif command -v apt &> /dev/null; then
  sudo apt clean
else
  echo "Neither Yay, Emerge, or Apt package managers found."
fi
