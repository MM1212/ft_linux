#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf m4-1.4.20.tar.xz

cd m4-1.4.20

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

cd ..

rm -rf m4-1.4.20
