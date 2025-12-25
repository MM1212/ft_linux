#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf xz-5.8.1.tar.xz

cd xz-5.8.1

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.8.1

make

make DESTDIR=$LFS install

# Remove the libtool archive file (harmful for cross compilation)
rm -v $LFS/usr/lib/liblzma.la

cd ..

rm -rf xz-5.8.1
