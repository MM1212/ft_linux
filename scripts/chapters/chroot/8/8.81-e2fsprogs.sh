#!/bin/bash
set -e

cd /sources

tar -xvpf e2fsprogs-1.47.3.tar.gz
cd e2fsprogs-1.47.3

# Build in a subdirectory as recommended
mkdir -v build
cd       build

../configure --prefix=/usr           \
             --sysconfdir=/etc       \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

make

make install

# Remove useless static libraries
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

# Update system info file
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

cd /sources
rm -rf e2fsprogs-1.47.3
