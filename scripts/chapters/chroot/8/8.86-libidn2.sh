#!/bin/bash
# LFS Chapter 8.86 - libidn2-2.3.8 (BLFS)
# Internationalized string handling library
# Depends on: libunistring

set -e

cd /sources
tar -xvpf libidn2-2.3.8.tar.gz
cd libidn2-2.3.8

./configure --prefix=/usr --disable-static

make

make install

# Return to sources directory and cleanup
cd ..
rm -rf libidn2-2.3.8
