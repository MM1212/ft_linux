#!/bin/bash
# LFS Chapter 8.85 - libunistring-1.3 (BLFS)
# Library for manipulating Unicode strings

set -e

cd /sources
tar -xvpf libunistring-1.3.tar.xz
cd libunistring-1.3

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/libunistring-1.3

make

make install

# Return to sources directory and cleanup
cd ..
rm -rf libunistring-1.3