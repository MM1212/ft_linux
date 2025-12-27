#!/bin/bash

set -e

cd /sources

tar -xvpf file-5.46.tar.gz

cd file-5.46

./configure --prefix=/usr

make

make install

cd ..

rm -rf file-5.46
