#!/bin/bash

set -e

cd /sources

tar -xvpf gdbm-1.26.tar.gz

cd gdbm-1.26

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

make

make install

cd ..

rm -rf gdbm-1.26
