#!/bin/bash

set -e

cd "$LFS"/sources

tar -xvpf linux-6.16.1.tar.xz

cd linux-6.16.1

make mrproper

make headers

find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

cd ..

rm -rf linux-6.16.1