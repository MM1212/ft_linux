#!/bin/bash

set -e

cd /sources

tar -xvpf flex-2.6.4.tar.gz

cd flex-2.6.4

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

make

make install

# Create symbolic link for lex compatibility
ln -sv flex   /usr/bin/lex
ln -sv flex.1 /usr/share/man/man1/lex.1

cd ..

rm -rf flex-2.6.4
