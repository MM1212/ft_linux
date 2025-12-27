#!/bin/bash

set -e

cd /sources

tar -xvpf pkgconf-2.5.1.tar.xz

cd pkgconf-2.5.1

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/pkgconf-2.5.1

make

make install

# Create symlinks for pkg-config compatibility
ln -sv pkgconf   /usr/bin/pkg-config
ln -sv pkgconf.1 /usr/share/man/man1/pkg-config.1

cd ..

rm -rf pkgconf-2.5.1
