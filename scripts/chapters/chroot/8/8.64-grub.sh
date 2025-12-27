#!/bin/bash
set -e

cd /sources

tar -xf grub-2.12.tar.xz
cd grub-2.12

# Unset any environment variables which may affect the build
unset {C,CPP,CXX,LD}FLAGS

# Add a file missing from the release tarball
echo depends bli part_gpt > grub-core/extra_deps.lst

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

cd /sources
rm -rf grub-2.12
