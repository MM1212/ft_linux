#!/bin/bash

set -e

cd /sources

tar -xvpf attr-2.5.2.tar.gz

cd attr-2.5.2

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.2

make

make install

cd ..

rm -rf attr-2.5.2
