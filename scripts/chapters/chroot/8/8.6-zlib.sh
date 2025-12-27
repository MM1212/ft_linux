#!/bin/bash

set -e

cd /sources

tar -xvpf zlib-1.3.1.tar.gz

cd zlib-1.3.1

./configure --prefix=/usr

make

make install

# Remove a useless static library
rm -fv /usr/lib/libz.a

cd ..

rm -rf zlib-1.3.1
