#!/bin/bash
set -e

cd /sources

tar -xvpf groff-1.23.0.tar.gz
cd groff-1.23.0

PAGE=letter ./configure --prefix=/usr

make

make install

cd /sources
rm -rf groff-1.23.0
