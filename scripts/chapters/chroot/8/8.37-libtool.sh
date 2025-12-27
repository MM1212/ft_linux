#!/bin/bash

set -e

cd /sources

tar -xvpf libtool-2.5.4.tar.xz

cd libtool-2.5.4

./configure --prefix=/usr

make

make install

# Remove a static library only useful for the test suite
rm -fv /usr/lib/libltdl.a

cd ..

rm -rf libtool-2.5.4
