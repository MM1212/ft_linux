#!/bin/bash

set -e

umount -v $LFS/dev/pts || true
mountpoint -q $LFS/dev/shm && umount -v $LFS/dev/shm || true
umount -v $LFS/dev || true
umount -v $LFS/run || true
umount -v $LFS/proc || true
umount -v $LFS/sys || true

umount -v $LFS/boot/efi || true
umount -v $LFS/boot || true
umount -v $LFS || true
swapoff -v $SWAP_PARTITION || true