#!/bin/bash

set -e

cd /sources

# Create privilege separation directory and user
install -v -g sys -m700 -d /var/lib/sshd

if ! getent group sshd > /dev/null; then
    groupadd -g 50 sshd
fi

if ! getent passwd sshd > /dev/null; then
    useradd  -c 'sshd PrivSep' \
             -d /var/lib/sshd  \
             -g sshd           \
             -s /bin/false     \
             -u 50 sshd
fi

tar -xvpf openssh-10.0p1.tar.gz

cd openssh-10.0p1

./configure --prefix=/usr                            \
            --sysconfdir=/etc/ssh                    \
            --with-privsep-path=/var/lib/sshd        \
            --with-default-path=/usr/bin             \
            --with-superuser-path=/usr/sbin:/usr/bin \
            --with-pid-dir=/run

make

make install

install -v -m755    contrib/ssh-copy-id /usr/bin

install -v -m644    contrib/ssh-copy-id.1 \
                    /usr/share/man/man1

install -v -m755 -d /usr/share/doc/openssh-10.0p1

install -v -m644    INSTALL LICENCE OVERVIEW README* \
                    /usr/share/doc/openssh-10.0p1

cd /sources
# Install sshd systemd unit (requires blfs-systemd-units)
if [ ! -d /sources/blfs-systemd-units-20241211 ]; then
    tar -xvpf blfs-systemd-units-20241211.tar.xz
fi
cd /blfs-systemd-units-20241211
make install-sshd

cd /sources
rm -rf openssh-10.0p1
rm -rf blfs-systemd-units-20241211

systemctl enable sshd.service
