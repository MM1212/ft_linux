#!/bin/bash
set -e

cd /sources

tar -xvpf patch-2.8.tar.xz
cd patch-2.8

./configure --prefix=/usr

make

make install

cd /sources
rm -rf patch-2.8
