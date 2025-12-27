#!/bin/bash
# LFS Chapter 8.64.3 - efibootmgr-18 (BLFS)
# Tool to manipulate the UEFI Boot Manager
# Depends on: efivar, popt

set -e

cd /sources
tar -xvpf efibootmgr-18.tar.gz
cd efibootmgr-18

make EFIDIR=LFS EFI_LOADER=grubx64.efi

make install EFIDIR=LFS

cd ..
rm -rf efibootmgr-18
