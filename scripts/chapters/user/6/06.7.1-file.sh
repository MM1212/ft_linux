#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf file-5.46.tar.gz

cd file-5.46

# Build a temporary copy of the file command on the build host
mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

# Prepare File for compilation
./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file

make DESTDIR=$LFS install

# Remove the libtool archive file (harmful for cross compilation)
rm -v $LFS/usr/lib/libmagic.la

cd ..

rm -rf file-5.46
