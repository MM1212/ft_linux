#!/bin/bash
set -e

cd /sources

tar -xvpf coreutils-9.7.tar.xz
cd coreutils-9.7

# Apply security patch
patch -Np1 -i ../coreutils-9.7-upstream_fix-1.patch

# Apply internationalization patch
patch -Np1 -i ../coreutils-9.7-i18n-1.patch

autoreconf -fv
automake -af
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make

make install

# Move programs to the locations specified by the FHS
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8

cd /sources
rm -rf coreutils-9.7
