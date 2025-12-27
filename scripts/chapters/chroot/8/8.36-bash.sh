#!/bin/bash

set -e

cd /sources

tar -xvpf bash-5.3.tar.gz

cd bash-5.3

./configure --prefix=/usr             \
            --without-bash-malloc     \
            --with-installed-readline \
            --docdir=/usr/share/doc/bash-5.3

make

make install

cd ..
rm -rf bash-5.3