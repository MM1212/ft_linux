#!/bin/bash

set -e

cd /sources

tar -xvpf bzip2-1.0.8.tar.gz

cd bzip2-1.0.8

# Apply a patch that will install the documentation for this package
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch

# Ensure installation of symbolic links are relative
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile

# Ensure the man pages are installed into the correct location
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

# Prepare a clean build for the shared library
make clean

# Build the shared library
make -f Makefile-libbz2_so
make clean

# Compile the package
make

# Install the programs
make PREFIX=/usr install

# Install the shared library
cp -av libbz2.so.* /usr/lib
rm -f /usr/lib/libbz2.so
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so

# Install the shared bzip2 binary and replace copies with symlinks
cp -v bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done

# Remove a useless static library
rm -fv /usr/lib/libbz2.a

cd ..

rm -rf bzip2-1.0.8
