#!/bin/bash

set -e

cd /sources

tar -xvpf check-0.15.2.tar.gz

cd check-0.15.2

./configure --prefix=/usr --disable-static

make

make docdir=/usr/share/doc/check-0.15.2 install

cd ..
rm -rf check-0.15.2
