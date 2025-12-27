#!/bin/bash
set -e

cd /sources

tar -xvpf texinfo-7.2.tar.xz
cd texinfo-7.2

# Fix a code pattern that causes Perl-5.42 or later to display a warning
sed 's/! $output_file eq/$output_file ne/' -i tp/Texinfo/Convert/*.pm

./configure --prefix=/usr

make

make install

cd /sources
rm -rf texinfo-7.2
