#!/bin/bash
set -e

cd /sources

tar -xvpf kbd-2.8.0.tar.xz
cd kbd-2.8.0

# Fix backspace and delete key behavior
patch -Np1 -i ../kbd-2.8.0-backspace-1.patch

# Remove the redundant resizecons program
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock

make

make install

cd /sources
rm -rf kbd-2.8.0
