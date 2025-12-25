DISK="/dev/sdb"
UEFI="yes"

BOOT_PARTITION="$DISK"1
ROOT_PARTITION="$DISK"2
SWAP_PARTITION="$DISK"3

LFS="/mnt/ft_linux"
umask 022

SOURCES_DIR="$LFS/sources"
HOST_SOURCES_LIST="resources/packages/wget-list-systemd"
HOST_SOURCES_MD5="md5sums" # Relative path to the md5sums file

LFS_USER="lfs"
LFS_GROUP="lfs"

# dynamically export all variables defined in this script
EXPORT_VARS=$(grep -E '^[A-Z_]+=' scripts/vars/host-environment.sh | cut -d= -f1 | xargs)

echo "Exporting variables: $EXPORT_VARS"
export $EXPORT_VARS