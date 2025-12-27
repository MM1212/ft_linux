#!/bin/bash

set -e

cd /sources

tar -xvpf psmisc-23.7.tar.xz

cd psmisc-23.7

./configure --prefix=/usr

make

make install

cd ..

rm -rf psmisc-23.7
