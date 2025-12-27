#!/bin/bash
# LFS Chapter 8.90 - Git-2.52.0 (BLFS)
# Distributed version control system
# Depends on: curl (recommended for https)

set -e

cd /sources
tar -xvpf git-2.52.0.tar.xz
cd git-2.52.0

./configure --prefix=/usr                   \
            --with-gitconfig=/etc/gitconfig \
            --with-python=python3

make

make perllibdir=/usr/lib/perl5/5.42/site_perl install

# Return to sources directory and cleanup
cd ..
rm -rf git-2.52.0
