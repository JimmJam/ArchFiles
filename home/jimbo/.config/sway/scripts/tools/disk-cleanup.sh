#!/usr/bin/env bash

# Define mount points and devices
MOUNT1="/mnt/Linux1"
MOUNT2="/mnt/Linux2"

# Get device names
DEVICE_1=$(df -P "$MOUNT1" | awk 'NR==2 {print $1}')
DEVICE_2=$(df -P "$MOUNT2" | awk 'NR==2 {print $1}')

# Defrag both devices
sudo e4defrag -c $MOUNT1
sudo e4defrag -c $MOUNT2

# Unmount both mount points
sudo umount "$MOUNT1"
sudo umount "$MOUNT2"

# Run fsck on the devices
sudo fsck -f "$DEVICE_1"
sudo e2fsck -f $DEVICE_1
sudo fsck -f "$DEVICE_2"
sudo e2fsck -f $DEVICE_2

# Remount the devices
sudo mount "$MOUNT1"
sudo mount "$MOUNT2"

echo "Disks cleaned."
