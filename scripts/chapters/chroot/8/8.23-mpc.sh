#!/bin/bash

set -e

cd /sources

tar -xvpf mpc-1.3.1.tar.gz

cd mpc-1.3.1

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.3.1

make
make html

make install
make install-html

cd ..

rm -rf mpc-1.3.1
