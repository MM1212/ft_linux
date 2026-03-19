#!/bin/bash

set -e

cd /sources

tar -xvpf libtasn1-4.20.0.tar.gz

cd libtasn1-4.20.0

./configure --prefix=/usr --disable-static

make

make install

cd ..

rm -rf libtasn1-4.20.0