#!/bin/bash
set -e

cd /sources

tar -xf wget-1.25.0.tar.gz
cd wget-1.25.0

./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-ssl=openssl

make

make install

cd /sources
rm -rf wget-1.25.0
