#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf grep-3.12.tar.xz

cd grep-3.12

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)

make

make DESTDIR=$LFS install

cd ..

rm -rf grep-3.12
