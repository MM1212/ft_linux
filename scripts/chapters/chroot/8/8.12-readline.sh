#!/bin/bash

set -e

cd /sources

tar -xvpf readline-8.3.tar.gz

cd readline-8.3

# Prevent moving old libraries to .old
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

# Prevent hard coding library search paths (rpath) into the shared libraries
sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.3

make SHLIB_LIBS="-lncursesw"

make install

# Install the documentation (optional)
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.3

cd ..

rm -rf readline-8.3
