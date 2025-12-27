#!/bin/bash
set -e

cd /sources

tar -xvpf iproute2-6.16.0.tar.xz
cd iproute2-6.16.0

# Prevent building arpd since it requires Berkeley DB
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

make NETNS_RUN_DIR=/run/netns

make SBINDIR=/usr/sbin install

cd /sources
rm -rf iproute2-6.16.0
