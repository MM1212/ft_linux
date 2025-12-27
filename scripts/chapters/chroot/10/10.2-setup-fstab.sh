#!/bin/bash

set -e

# This script sets up the /etc/fstab file inside the chroot environment.

BOOT_PARTITION_ID=$(blkid -s UUID -o value "$BOOT_PARTITION")
BOOT_EFI_PARTITION_ID=$(blkid -s UUID -o value "$BOOT_EFI_PARTITION")
ROOT_PARTITION_ID=$(blkid -s UUID -o value "$ROOT_PARTITION")
SWAP_PARTITION_ID=$(blkid -s UUID -o value "$SWAP_PARTITION")


cat > /etc/fstab << EOF
# Begin /etc/fstab

# file system	mount-point	type	options	dump	fsck order

UUID=$ROOT_PARTITION_ID	/	ext4	defaults	0	1

# /boot was on $BOOT_PARTITION during installation
UUID=$BOOT_PARTITION_ID	/boot	ext4	defaults	0	2

# /boot/efi was on $BOOT_EFI_PARTITION during installation
UUID=$BOOT_EFI_PARTITION_ID	/boot/efi	vfat	umask=0077	0	1

# swap was on $SWAP_PARTITION during installation
UUID=$SWAP_PARTITION_ID	none	swap	sw,discard	0	0

# End /etc/fstab
EOF