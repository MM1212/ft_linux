#!/bin/bash

set -e

# This script sets up disk partitions for the installation.

# Available environmment variables inside host-environment.sh:
# DISK - The target disk for partitioning (e.g., /dev/sda)
# UEFI - Set to "yes" if the system uses UEFI, otherwise "no"

# Required partitions:
# 1. Boot partition, 512MB, type EFI System (if UEFI)
# 2. Root partition, at least 20GB, type Linux filesystem
# 3. Swap partition, 2GB, type Linux swap

# Steps:

# g - Create a new GPT partition table

# Create EFI System partition

# n - New partition
# 1 - Partition number 1
# \n - To accept default first sector
# +512M - Size of the partition
# t - Change partition type (partition 1 is selected by default)
# 1 - Type code for EFI System

# Create Root partition
# n - New partition
# 2 - Partition number 2
# \n - To accept default first sector
# +20G - Size of the partition

# Create Swap partition
# n - New partition
# 3 - Partition number 3
# \n - To accept default first sector
# +2G - Size of the partition
# t - Change partition type
# 3 - Select partition 3
# 19 - Type code for Linux swap


fdisk $DISK <<EOF
g
n
1

+512M
t
1

n
2

+20G

n
3

+2G
t
3
19
w
EOF

echo "Disk partitioning completed on $DISK"

