#!/bin/bash

set -e

if [ -z "$LFS" ]; then
    echo "LFS variable is not set. Exiting."
    exit 1
fi

bash scripts/chapters/root/2/02.7-mount-file-system.sh
bash scripts/chapters/root/7/7.3-virtual-kernel.sh
bash scripts/chapters/root/7/7.4-enter-chroot-env.sh

bash scripts/run/5-cleanup.sh