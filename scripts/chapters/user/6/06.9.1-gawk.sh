#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf gawk-5.3.2.tar.xz

cd gawk-5.3.2

# Ensure some unneeded files are not installed
sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

cd ..

rm -rf gawk-5.3.2
