#!/bin/bash
set -e

cd /sources

tar -xvpf libpipeline-1.5.8.tar.gz
cd libpipeline-1.5.8

./configure --prefix=/usr

make

make install

cd /sources
rm -rf libpipeline-1.5.8
