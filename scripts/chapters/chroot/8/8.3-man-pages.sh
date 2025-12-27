#!/bin/bash

set -e

cd /sources

tar -xvpf man-pages-6.15.tar.xz

cd man-pages-6.15

# Remove two man pages for password hashing functions
# Libxcrypt will provide a better version of these man pages
rm -v man3/crypt*

make -R GIT=false prefix=/usr install

cd ..

rm -rf man-pages-6.15
