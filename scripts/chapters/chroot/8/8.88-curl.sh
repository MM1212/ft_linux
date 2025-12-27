#!/bin/bash
# LFS Chapter 8.88 - cURL-8.15.0 (BLFS)
# Utility and library for transferring files with URL syntax
# Depends on: libpsl, openssl

set -e

cd /sources
tar -xvpf curl-8.15.0.tar.xz
cd curl-8.15.0

./configure --prefix=/usr                           \
            --disable-static                        \
            --with-openssl                          \
            --enable-threaded-resolver              \
            --with-ca-path=/etc/ssl/certs

make

make install

# Install documentation
rm -rf docs/examples/.deps

find docs \( -name Makefile\* -o  \
             -name \*.1       -o  \
             -name \*.3       -o  \
             -name CMakeLists.txt \) -delete

cp -v -R docs -T /usr/share/doc/curl-8.15.0

# Return to sources directory and cleanup
cd ..
rm -rf curl-8.15.0
