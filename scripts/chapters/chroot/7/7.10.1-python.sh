#!/bin/bash

set -e

cd /sources

tar -xvpf Python-3.13.7.tar.xz

cd Python-3.13.7

./configure --prefix=/usr       \
            --enable-shared     \
            --without-ensurepip \
            --without-static-libpython

make

make install