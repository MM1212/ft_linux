#!/bin/bash

set -e

cd /sources

tar -xvpf dhcpcd-10.2.4.tar.xz

cd dhcpcd-10.2.4

./configure --prefix=/usr                \
            --sysconfdir=/etc            \
            --libexecdir=/usr/lib/dhcpcd \
            --dbdir=/var/lib/dhcpcd      \
            --runstatedir=/run           \
            --disable-privsep

make

make install

cd ..
rm -rf dhcpcd-10.2.4

tar -xvpf blfs-systemd-units-20241211.tar.xz

cd blfs-systemd-units-20241211

# Install dhcpcd systemd unit
make install-dhcpcd

cd ..

rm -rf blfs-systemd-units-20241211

systemctl start dhcpcd@eth0.service

systemctl enable dhcpcd@eth0.service
