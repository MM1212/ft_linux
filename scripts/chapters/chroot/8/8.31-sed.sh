#!/bin/bash

set -e

cd /sources

tar -xvpf sed-4.9.tar.xz

cd sed-4.9

./configure --prefix=/usr

make
make html

make install
install -d -m755           /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9

cd ..

rm -rf sed-4.9
