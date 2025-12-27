#!/bin/bash

set -e

cd /sources

tar -xvpf shadow-4.18.0.tar.xz

cd shadow-4.18.0

# Disable the installation of the groups program and its man pages
sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

# Use YESCRYPT method of password encryption and fix paths
sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
    -e 's:/var/spool/mail:/var/mail:'                   \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
    -i etc/login.defs

touch /usr/bin/passwd

./configure --sysconfdir=/etc   \
            --disable-static    \
            --with-{b,yes}crypt \
            --without-libbsd    \
            --with-group-name-max-length=32

make

make exec_prefix=/usr install
make -C man install-man

# Enable shadowed passwords
pwconv

# Enable shadowed group passwords
grpconv

# Create /etc/default/useradd
mkdir -p /etc/default
useradd -D --gid 999

cd ..

rm -rf shadow-4.18.0
