#!/bin/bash

set -e

cd /sources

tar -xvpf gettext-0.26.tar.xz

cd gettext-0.26

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.26

make

make install
chmod -v 0755 /usr/lib/preloadable_libintl.so

cd ..

rm -rf gettext-0.26
