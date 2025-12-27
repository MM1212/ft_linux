#!/bin/bash
# LFS Chapter 8.87 - libpsl-0.21.5 (BLFS)
# Library for accessing the Public Suffix List
# Depends on: libidn2, libunistring

set -e

cd /sources
tar -xvpf libpsl-0.21.5.tar.gz
cd libpsl-0.21.5

mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release

ninja

ninja install

# Return to sources directory and cleanup
cd /sources
rm -rf libpsl-0.21.5
