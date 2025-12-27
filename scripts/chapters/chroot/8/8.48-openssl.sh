#!/bin/bash
set -e

cd /sources

tar -xf openssl-3.5.2.tar.gz
cd openssl-3.5.2

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make

# Remove static libraries from install
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

# Add the version to the documentation directory name
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.5.2

cd /sources
rm -rf openssl-3.5.2
