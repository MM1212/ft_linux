#!/bin/bash

set -e

# This script mounts the file systems to prepare for installation.

# Available environment variables inside host-environment.sh:
# BOOT_PARTITION - The boot partition (e.g., /dev/sda1)
# BOOT_EFI_PARTITION - The EFI System partition (e.g., /dev/sda2)
# ROOT_PARTITION - The root partition (e.g., /dev/sda3)
# LFS - The mount point for the Linux From Scratch system (e.g., /mnt/lfs)

mkdir -pv $LFS

# Mount the root partition
mount -v -t ext4 $ROOT_PARTITION $LFS

# Mount the boot partition
mkdir -pv $LFS/boot
mount -v -t ext4 $BOOT_PARTITION $LFS/boot

# Mount the boot efi partition
mkdir -pv $LFS/boot/efi
mount -v -t vfat $BOOT_EFI_PARTITION $LFS/boot/efi

# Enable swap
swapon $SWAP_PARTITION || true

# Update permissions
chown root:root $LFS
chmod 755 $LFS

echo "File systems have been mounted successfully."