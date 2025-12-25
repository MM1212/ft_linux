#!/bin/bash

set -e

# This script sets up file systems on the created partitions.

# Available environment variables inside host-environment.sh:
# BOOT_PARTITION - The boot partition (e.g., /dev/sda1)
# ROOT_PARTITION - The root partition (e.g., /dev/sda2)
# SWAP_PARTITION - The swap partition (e.g., /dev/sda3)

# Format the boot partition as FAT32 (if UEFI)
if [ "$UEFI" == "yes" ]; then
  mkfs.fat -F32 $BOOT_PARTITION
fi

# Format the root partition as ext4

mkfs.ext4 $ROOT_PARTITION

# Set up the swap partition

mkswap $SWAP_PARTITION
swapon $SWAP_PARTITION

echo "File systems have been set up successfully."