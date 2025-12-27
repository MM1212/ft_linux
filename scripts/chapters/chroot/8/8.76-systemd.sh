#!/bin/bash
set -e

cd /sources

tar -xvpf systemd-257.8.tar.gz
cd systemd-257.8

# Remove two unneeded groups from the default udev rules
sed -e 's/GROUP="render"/GROUP="video"/' \
    -e 's/GROUP="sgx", //'               \
    -i rules.d/50-udev-default.rules.in

mkdir -p build
cd       build

meson setup ..                \
      --prefix=/usr           \
      --buildtype=release     \
      -D default-dnssec=no    \
      -D firstboot=false      \
      -D install-tests=false  \
      -D ldconfig=false       \
      -D sysusers=false       \
      -D rpmmacrosdir=no      \
      -D homed=disabled       \
      -D userdb=false         \
      -D man=disabled         \
      -D mode=release         \
      -D pamconfdir=no        \
      -D dev-kvm-mode=0660    \
      -D nobody-group=nogroup \
      -D sysupdate=disabled   \
      -D ukify=disabled       \
      -D docdir=/usr/share/doc/systemd-257.8

ninja

ninja install

# Install the man pages
tar -xvpf ../../systemd-man-pages-257.8.tar.xz \
    --no-same-owner --strip-components=1     \
    -C /usr/share/man

# Create the /etc/machine-id file needed by systemd-journald
systemd-machine-id-setup

# Set up the basic target structure
systemctl preset-all

cd /sources
rm -rf systemd-257.8
