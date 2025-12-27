#!/bin/bash

set -e

cd /sources

tar -xvpf libcap-2.76.tar.xz

cd libcap-2.76

# Prevent static libraries from being installed
sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib

make prefix=/usr lib=lib install

cd ..

rm -rf libcap-2.76
