#!/bin/bash

set -e

# This script sets up the necessary directory structure for the Linux From Scratch system.

# Available environment variables inside host-environment.sh:
# LFS - The mount point for the Linux From Scratch system (e.g., /mnt/lfs)

# Create necessary directories
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

# Create symbolic links
for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

# Create architecture-specific directories
case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

# Create tools directory
mkdir -pv $LFS/tools