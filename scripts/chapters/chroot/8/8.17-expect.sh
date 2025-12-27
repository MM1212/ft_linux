#!/bin/bash

set -e

cd /sources

tar -xvpf expect5.45.4.tar.gz

cd expect5.45.4

# Verify that PTYs are working properly
python3 -c 'from pty import spawn; spawn(["echo", "ok"])'

# Apply patch for gcc-15.1 or later
patch -Np1 -i ../expect-5.45.4-gcc15-1.patch

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --disable-rpath         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

make

make install

ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib

cd ..

rm -rf expect5.45.4
