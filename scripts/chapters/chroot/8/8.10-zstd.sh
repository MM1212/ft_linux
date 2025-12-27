#!/bin/bash

set -e

cd /sources

tar -xvpf zstd-1.5.7.tar.gz

cd zstd-1.5.7

make prefix=/usr

make prefix=/usr install

# Remove the static library
rm -v /usr/lib/libzstd.a

cd ..

rm -rf zstd-1.5.7
