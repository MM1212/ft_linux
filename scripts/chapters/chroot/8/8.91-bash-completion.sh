#!/bin/bash

set -e

cd /sources

# Download bash-completion if not present
if [ ! -f bash-completion-2.14.0.tar.xz ]; then
    wget https://github.com/scop/bash-completion/releases/download/2.14.0/bash-completion-2.14.0.tar.xz
fi

tar -xvpf bash-completion-2.14.0.tar.xz

cd bash-completion-2.14.0

./configure --prefix=/usr --sysconfdir=/etc

make

make install

cd ..
rm -rf bash-completion-2.14.0
