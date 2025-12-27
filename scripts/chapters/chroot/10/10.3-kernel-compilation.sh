#!/bin/bash

set -e

OLD_PWD=$(pwd)

cd /sources

tar -xvpf linux-6.16.1.tar.xz
cd linux-6.16.1

mkdir -pv /usr/src/kernel-$KERNEL_VERSION
cp -rv . /usr/src/kernel-$KERNEL_VERSION

# make mrproper

make defconfig
cp $OLD_PWD/resources/.config-x86_64-lfs .config

# Set CONFIG_LOCALVERSION to -STUDENT_LOGIN using kernel's 'scripts/config' utility
scripts/config --set-str CONFIG_LOCALVERSION "-$STUDENT_LOGIN"

make

make modules_install

cp -v arch/x86/boot/bzImage /boot/$KERNEL_VMLINUZ_FILE_NAME
cp -v System.map /boot/System.map-$KERNEL_VERSION
cp -v .config /boot/config-$KERNEL_VERSION
cp -v .config /usr/src/kernel-$KERNEL_VERSION/.config
cp -vr Documentation /usr/share/doc/linux-$KERNEL_VERSION

# Update modprobe usb order loading

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF