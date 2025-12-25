#!/bin/bash

set -e

cd /sources

tar -xvpf bison-3.8.2.tar.xz

cd bison-3.8.2

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.8.2

make

make install

cd ..

rm -rf bison-3.8.2