#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf patch-2.8.tar.xz

cd patch-2.8

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

cd ..

rm -rf patch-2.8
