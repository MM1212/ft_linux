#!/bin/bash

set -e

echo 12.4-systemd > /etc/lfs-release

cat > /etc/lsb-release << EOF
DISTRIB_ID="ft_linux"
DISTRIB_RELEASE="12.4-systemd"
DISTRIB_CODENAME="$STUDENT_LOGIN"
DISTRIB_DESCRIPTION="ft_linux"
EOF

cat > /etc/os-release << "EOF"
NAME="ft_linux"
VERSION="12.4-systemd"
ID=lfs
PRETTY_NAME="ft_linux 12.4-systemd"
VERSION_CODENAME="$STUDENT_LOGIN"
HOME_URL="https://www.linuxfromscratch.org/lfs/"
RELEASE_TYPE="stable"
EOF

# Set root password
echo "root:$ROOT_PASSWORD" | chpasswd