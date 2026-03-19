#!/bin/bash
set -e

cd /sources

tar -xf curl-8.17.0.tar.xz
cd curl-8.17.0

./configure --prefix=/usr                      \
            --disable-static                   \
            --with-openssl                     \
            --enable-threaded-resolver         \
            --with-ca-path=/etc/ssl/certs

make

make install

cd /sources
rm -rf curl-8.17.0
