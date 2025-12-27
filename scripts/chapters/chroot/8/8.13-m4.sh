#!/bin/bash

set -e

cd /sources

tar -xvpf m4-1.4.20.tar.xz

cd m4-1.4.20

./configure --prefix=/usr

make

make install

cd ..

rm -rf m4-1.4.20
