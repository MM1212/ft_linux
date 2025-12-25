#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf gzip-1.14.tar.xz

cd gzip-1.14

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

cd ..

rm -rf gzip-1.14
