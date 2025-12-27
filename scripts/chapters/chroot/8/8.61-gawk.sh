#!/bin/bash
set -e

cd /sources

tar -xvpf gawk-5.3.2.tar.xz
cd gawk-5.3.2

# Ensure some unneeded files are not installed
sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make

rm -f /usr/bin/gawk-5.3.2
make install

# Create man page symlink
ln -sv gawk.1 /usr/share/man/man1/awk.1

cd /sources
rm -rf gawk-5.3.2
