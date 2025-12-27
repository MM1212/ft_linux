#!/bin/bash
# LFS Chapter 8.64.2 - efivar-39 (BLFS)
# Tools and libraries to manipulate EFI variables
# Required by: efibootmgr

set -e

cd /sources
tar -xvpf efivar-39.tar.gz
cd efivar-39

make ENABLE_DOCS=0

make install ENABLE_DOCS=0 LIBDIR=/usr/lib

# Install man pages that don't need mandoc
install -vm644 docs/efivar.1 /usr/share/man/man1
install -vm644 docs/*.3      /usr/share/man/man3

cd ..
rm -rf efivar-39
