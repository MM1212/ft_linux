#!/bin/bash

set -e

# This script sets up file systems on the created partitions.

# Available environment variables inside host-environment.sh:
# BOOT_PARTITION - The boot partition (e.g., /dev/sda1)
# BOOT_EFI_PARTITION - The EFI System partition (e.g., /dev/sda2)
# ROOT_PARTITION - The root partition (e.g., /dev/sda3)
# SWAP_PARTITION - The swap partition (e.g., /dev/sda4)

# Format the boot partition as ext4
mkfs.ext4 $BOOT_PARTITION

# Format the boot efi partition as FAT32
mkfs.fat -F32 $BOOT_EFI_PARTITION

# Format the root partition as ext4
mkfs.ext4 $ROOT_PARTITION

# Set up the swap partition
mkswap $SWAP_PARTITION

echo "File systems have been set up successfully."