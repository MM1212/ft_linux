#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf ncurses-6.5-20250809.tgz

cd ncurses-6.5-20250809

# Build the tic program on the build host
mkdir build
pushd build
  ../configure --prefix=$LFS/tools AWK=gawk
  make -C include
  make -C progs tic
  install progs/tic $LFS/tools/bin
popd

# Prepare Ncurses for compilation
./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping          \
            AWK=gawk

make

make DESTDIR=$LFS install

# Create symlink for libncurses.so
ln -sv libncursesw.so $LFS/usr/lib/libncurses.so

# Edit curses.h to always use wide-character data structure definition
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i $LFS/usr/include/curses.h

cd ..

rm -rf ncurses-6.5-20250809
