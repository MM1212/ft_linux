#!/bin/bash

set -e

cd /sources

tar -xvpf texinfo-7.2.tar.xz

cd texinfo-7.2

./configure --prefix=/usr

make

make install