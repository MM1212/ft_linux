#!/bin/bash

set -e

cd /sources

tar -xvpf grep-3.12.tar.xz

cd grep-3.12

# Remove a warning about using egrep and fgrep that makes tests on some packages fail
sed -i "s/echo/#echo/" src/egrep.sh

./configure --prefix=/usr

make

make install

cd ..

rm -rf grep-3.12
