#!/bin/bash

set -e

cd /sources

tar -xvpf expat-2.7.1.tar.xz

cd expat-2.7.1

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.7.1

make

make install

# Install the documentation (optional)
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.7.1

cd ..

rm -rf expat-2.7.1
