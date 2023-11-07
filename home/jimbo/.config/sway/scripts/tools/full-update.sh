#!/usr/bin/env bash
echo "Updating host"
if command -v $arch &> /dev/null; then
  yay
elif command -v apt &> /dev/null; then
  sudo apt update && sudo apt upgrade
elif command -v nix-env &> /dev/null; then
  sudo nixos-rebuild switch --upgrade
else
  echo "Neither Yay, Apt or an Nix package managers found."
fi
cleanup &> /dev/null

echo "Update Server"
ssh server -t 'sudo apt update && sudo apt upgrade'
