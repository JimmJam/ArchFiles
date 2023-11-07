#!/usr/bin/env bash

# Run the nvidia-smi command and capture the VRAM usage and GPU utilization output
if lspci -k | grep "Kernel driver in use: nvidia" &> /dev/null; then
  vram_usage_mb=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)
  temperature=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
elif lspci -k | grep "Kernel driver in use: amdgpu" &> /dev/null; then
  vram_usage_mb=$(echo "$(cat /sys/class/drm/card0/device/mem_info_vram_used || cat /sys/class/drm/card1/device/mem_info_vram_used) / 1024 / 1024" | bc)
  temperature=$(sensors | grep 'edge' | awk '{print $2}' | sed 's/[^0-9.-]//g')
fi

# Check if VRAM usage is under 1GB
if [ $vram_usage_mb -lt 1024 ]; then
  vram_usage_display="${vram_usage_mb}M"
else
  # Convert MB to GiB
  vram_usage_gib=$(bc <<< "scale=2; $vram_usage_mb / 1024")
  vram_usage_display="${vram_usage_gib}G"
fi

# Print the VRAM usage in MB or GiB, and include GPU utilization and temperature
echo "{\"text\":\"󰢮  ${vram_usage_display}\",\"tooltip\":\"${temperature}°C\"}"
