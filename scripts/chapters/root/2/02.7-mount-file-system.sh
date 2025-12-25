#!/bin/bash

set -e

# This script mounts the file systems to prepare for installation.

# Available environment variables inside host-environment.sh:
# BOOT_PARTITION - The boot partition (e.g., /dev/sda1)
# ROOT_PARTITION - The root partition (e.g., /dev/sda2)
# LFS - The mount point for the Linux From Scratch system (e.g., /mnt/lfs)
# UEFI - Set to "yes" if the system uses UEFI, otherwise "no"

mkdir -pv $LFS

# Mount the root partition

mount -v -t ext4 $ROOT_PARTITION $LFS

# Mount the boot partition (if UEFI)
if [ "$UEFI" == "yes" ]; then
  mkdir -pv $LFS/boot/efi
  mount -v -t vfat $BOOT_PARTITION $LFS/boot/efi
fi

# Update permissions

chown root:root $LFS
chmod 755 $LFS

echo "File systems have been mounted successfully."