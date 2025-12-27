#!/bin/bash

set -e

cd /sources

tar -xvpf bc-7.0.3.tar.xz

cd bc-7.0.3

CC='gcc -std=c99' ./configure --prefix=/usr -G -O3 -r

make

make install

cd ..

rm -rf bc-7.0.3
