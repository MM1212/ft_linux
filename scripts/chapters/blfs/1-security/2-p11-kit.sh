#!/bin/bash

set -e

cd /sources

tar -xvpf p11-kit-0.25.5.tar.xz

cd p11-kit-0.25.5
rm -rf build

sed '20,$ d' -i trust/trust-extract-compat &&

cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

mkdir build
cd build

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D trust_paths=/etc/pki/anchors &&
ninja
ninja install

ln -sfv /usr/libexec/p11-kit/trust-extract-compat \
        /usr/bin/update-ca-certificates

ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so

cd ../..

rm -rf p11-kit-0.25.5