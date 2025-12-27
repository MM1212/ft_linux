#!/bin/bash
set -e

cd /sources

tar -xf dbus-1.16.2.tar.xz
cd dbus-1.16.2

mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..

ninja

ninja install

# Create a symlink so that D-Bus and systemd can use the same machine-id file
ln -sfv /etc/machine-id /var/lib/dbus

cd /sources
rm -rf dbus-1.16.2
