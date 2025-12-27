#!/bin/bash

set -e

# TODO: will come in handy for the kfs modules

# mkdir -pv /etc/systemd/system/getty@tty1.service.d

# cat > /etc/systemd/system/getty@tty1.service.d/noclear.conf << EOF
# [Service]
# TTYVTDisallocate=no
# EOF

# Only keep 5GB of coredumps
mkdir -pv /etc/systemd/coredump.conf.d

cat > /etc/systemd/coredump.conf.d/maxuse.conf << EOF
[Coredump]
MaxUse=5G
EOF