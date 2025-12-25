#!/bin/bash

set -e

# This script sets up the user and group for building the Linux From Scratch system.

# Available environment variables inside host-environment.sh:
# LFS - The mount point for the Linux From Scratch system (e.g., /mnt/lfs)
# LFS_USER - The username for the LFS build user (e.g., lfs)
# LFS_GROUP - The group name for the LFS build user (e.g., lfs)

# Create the LFS group if it doesn't exist
if ! getent group $LFS_GROUP > /dev/null 2>&1; then
  groupadd $LFS_GROUP
else
  echo "Group $LFS_GROUP already exists."
fi

# Create the LFS user if it doesn't exist
if ! id -u $LFS_USER > /dev/null 2>&1; then
  useradd -s /bin/bash -g $LFS_GROUP -m -k /dev/null -c "LFS Builder" $LFS_USER
else
  echo "User $LFS_USER already exists."
fi

# Set ownership of the LFS directory
chown -v lfs $LFS/{usr{,/*},var,etc,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
