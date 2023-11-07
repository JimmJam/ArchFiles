#!/usr/bin/env bash

# Function to run arch command
run_arch_command() {
  yay -Qq | fzf --preview "yay -Qil {}" --layout=reverse --bind "enter:execute(yay -Qil {} | less)"
}

# Function to run apt command
run_apt_command() {
  dpkg -l | grep ^ii | awk '{print $2}' | fzf --preview 'apt-cache show {}' --layout=reverse --bind 'enter:execute(apt-cache show {} | less)'
}

# Function to run emerge command
run_emerge_command() {
  qlist -IC | awk '{print $1}' | fzf --preview 'equery m {}; echo ""; equery u {}; echo ""; equery f {}' --layout=reverse --bind 'enter:execute( (equery m {}; echo ""; equery u {}; echo ""; equery f {}) | less)'
}

# Check for yay and run the command
if command -v yay &> /dev/null; then
  run_arch_command
elif command -v apt &> /dev/null; then
  run_apt_command
elif command -v emerge &> /dev/null; then
  run_emerge_command
elif command -v nixos-rebuild &> /dev/null; then
  echo -e "NixOS does not have a good way of listing installed packages.\nPlease use the config file."
else
  echo "Neither Yay, Apt or Nix package managers found."
fi
