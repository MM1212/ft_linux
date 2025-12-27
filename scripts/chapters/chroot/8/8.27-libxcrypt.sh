#!/bin/bash

set -e

cd /sources

tar -xvpf libxcrypt-4.4.38.tar.xz

cd libxcrypt-4.4.38

./configure --prefix=/usr                \
            --enable-hashes=strong,glibc \
            --enable-obsolete-api=no     \
            --disable-static             \
            --disable-failure-tokens

make

make install

cd ..

rm -rf libxcrypt-4.4.38
