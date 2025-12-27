#!/bin/bash

set -e

cd /sources

tar -xvpf gmp-6.3.0.tar.xz

cd gmp-6.3.0

# Make an adjustment for compatibility with gcc-15 and later
sed -i '/long long t1;/,+1s/()/(...)/' configure

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.3.0

make
make html

make install
make install-html

cd ..

rm -rf gmp-6.3.0
