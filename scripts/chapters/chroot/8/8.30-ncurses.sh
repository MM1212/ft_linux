#!/bin/bash

set -e

cd /sources

tar -xvpf ncurses-6.5-20250809.tgz

cd ncurses-6.5-20250809

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make

# Install using DESTDIR to avoid crash and replace library correctly
make DESTDIR=$PWD/dest install
install -vm755 dest/usr/lib/libncursesw.so.6.5 /usr/lib
rm -v  dest/usr/lib/libncursesw.so.6.5
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h
cp -av dest/* /

# Create symlinks for non-wide-character library compatibility
for lib in ncurses form panel menu ; do
    ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc
done

# Make sure old applications that look for -lcurses are still buildable
ln -sfv libncursesw.so /usr/lib/libcurses.so

# Install the documentation (optional)
cp -v -R doc -T /usr/share/doc/ncurses-6.5-20250809

cd ..

rm -rf ncurses-6.5-20250809
