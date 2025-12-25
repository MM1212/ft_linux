#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf bash-5.3.tar.gz

cd bash-5.3

./configure --prefix=/usr                      \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT                    \
            --without-bash-malloc

make

make DESTDIR=$LFS install

# Make a link for programs that use sh for a shell
ln -sv bash $LFS/bin/sh

cd ..

rm -rf bash-5.3
