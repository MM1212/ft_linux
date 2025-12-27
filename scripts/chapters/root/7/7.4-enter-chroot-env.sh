#!/bin/bash

set -e

cp -r . "$LFS"/setup_lfs

FLAG="--login"
FLAG2=""

if [ "$CI" == "true" ]; then 
  echo "Running in scripted mode inside chroot ..."
  FLAG="-c"
  FLAG2="cd /setup_lfs && bash scripts/run/4.sh"
fi

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    DISK="$DISK" \
    BOOT_PARTITION="$BOOT_PARTITION" \
    BOOT_EFI_PARTITION="$BOOT_EFI_PARTITION" \
    ROOT_PARTITION="$ROOT_PARTITION" \
    SWAP_PARTITION="$SWAP_PARTITION" \
    STUDENT_LOGIN="$STUDENT_LOGIN" \
    KERNEL_VERSION="$KERNEL_VERSION" \
    KERNEL_VMLINUZ_FILE_NAME="$KERNEL_VMLINUZ_FILE_NAME" \
    ROOT_PASSWORD="$ROOT_PASSWORD" \
    /bin/bash $FLAG ${FLAG2:+"$FLAG2"}

echo "Exited chroot environment."