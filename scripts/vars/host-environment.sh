DISK="/dev/sdb"
UEFI="yes"

BOOT_PARTITION="/dev/sdb1"
ROOT_PARTITION="/dev/sdb2"
SWAP_PARTITION="/dev/sdb3"

LFS="/mnt/ft_linux"
umask 022

SOURCES_DIR="$LFS/sources"
HOST_SOURCES_LIST="resources/packages/wget-list-systemd"
HOST_SOURCES_MD5="md5sums" # Relative path to the md5sums file

export DISK UEFI BOOT_PARTITION ROOT_PARTITION SWAP_PARTITION LFS SOURCES_DIR HOST_SOURCES_LIST HOST_SOURCES_MD5