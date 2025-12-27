#!/bin/bash

set -e

# This script sets up disk partitions for the installation.

# Available environmment variables inside host-environment.sh:
# DISK - The target disk for partitioning (e.g., /dev/sda)

# Required partitions:
# 1. Boot partition, 512MB, type EXT4
# 2. EFI System partition, 512MB, type EFI System
# 3. Root partition, at least 20GB, type Linux filesystem
# 4. Swap partition, 2GB, type Linux swap

# Steps:

# g - Create a new GPT partition table

# Create EXT4 boot partition
# n - New partition
# 1 - Partition number 1
# \n - To accept default first sector
# +512M - Size of the partition

# Create EFI System partition
# n - New partition
# 2 - Partition number 2
# \n - To accept default first sector
# +512M - Size of the partition
# t - Change partition type
# 2 - Select partition 2
# 1 - Type code for EFI System

# Create Root partition
# n - New partition
# 3 - Partition number 3
# \n - To accept default first sector
# +20G - Size of the partition

# Create Swap partition
# n - New partition
# 4 - Partition number 4
# \n - To accept default first sector
# +2G - Size of the partition
# t - Change partition type
# 4 - Select partition 4
# 19 - Type code for Linux swap


fdisk $DISK <<EOF
g

n
1

+512M

n
2

+512M
t
2
1

n
3

+20G

n
4

+2G
t
4
19

w
EOF

echo "Disk partitioning completed on $DISK"

