#!/bin/bash
set -e

cd /sources

tar -xf git-2.52.0.tar.xz
cd git-2.52.0

./configure --prefix=/usr                  \
            --with-gitconfig=/etc/gitconfig \
            --with-python=python3

make

make perllibdir=/usr/lib/perl5/5.42/site_perl install

cd /sources
rm -rf git-2.52.0
