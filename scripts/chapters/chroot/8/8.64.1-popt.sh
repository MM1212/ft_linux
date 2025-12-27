#!/bin/bash
# LFS Chapter 8.64.1 - popt-1.19 (BLFS)
# Command-line option parsing library
# Required by: efibootmgr

set -e

cd /sources
tar -xvpf popt-1.19.tar.gz
cd popt-1.19

./configure --prefix=/usr --disable-static

make

make install

cd ..
rm -rf popt-1.19
