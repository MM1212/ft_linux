#!/bin/bash
set -e

cd /sources

tar -xvpf XML-Parser-2.47.tar.gz
cd XML-Parser-2.47

perl Makefile.PL

make

make install

cd /sources
rm -rf XML-Parser-2.47
