#!/bin/bash
set -e

cd /sources

tar -xf Python-3.13.7.tar.xz
cd Python-3.13.7

./configure --prefix=/usr          \
            --enable-shared        \
            --with-system-expat    \
            --enable-optimizations \
            --without-static-libpython

make

make install

# Create pip configuration file to suppress warnings
cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

cd /sources
rm -rf Python-3.13.7
