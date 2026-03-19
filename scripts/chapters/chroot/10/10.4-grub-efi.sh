#!/bin/bash

set -e

grub-install \
    --target=x86_64-efi \
    --efi-directory=/boot/efi \
    --bootloader-id=LFS \
    --recheck

