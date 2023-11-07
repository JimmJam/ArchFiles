#!/usr/bin/env bash

# Function to count updates for yay
count_updates_arch(){ 
  checkupdates-with-aur | wc -l;
}

# Function to count updates for emerge
count_updates_gentoo(){
  sudo emerge --sync 2>/dev/null
  emerge -puDN @world | grep ebuild | wc -l
}

# Function to count updates for apt
count_updates_apt(){ apt list --upgradable 2>/dev/null | grep -v 'Listing' | grep -c .; }

# Check for package manager and count updates
if command -v pacman &> /dev/null; then
  updates="$(count_updates_arch)"
  logo=""
elif command -v emerge &> /dev/null; then
  updates=$(count_updates_gentoo)
  logo=""
elif command -v apt &> /dev/null; then
  updates=$(count_updates_apt)
  logo=""
else
  updates="0"
  logo="󰠗"
fi

# Print the count
if command -v nixos-rebuild &> /dev/null; then
  ;
else
  echo {\"text\":\"${logo}'  '${updates}\",\"tooltip\":\"${updates} Updates Available\",\"class\":\"updates\"}
fi
