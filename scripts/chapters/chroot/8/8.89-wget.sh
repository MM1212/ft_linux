#!/bin/bash
# LFS Chapter 8.89 - Wget-1.25.0 (BLFS)
# Non-interactive file downloader
# Depends on: libpsl, openssl

set -e

cd /sources
tar -xvpf wget-1.25.0.tar.gz
cd wget-1.25.0

./configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-ssl=openssl

make

make install

# Return to sources directory and cleanup
cd ..
rm -rf wget-1.25.0
