#!/bin/bash

set -e

cd /sources

tar -xvpf gettext-0.26.tar.xz

cd gettext-0.26

./configure --disable-shared

make

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin

cd ..

rm -rf gettext-0.26