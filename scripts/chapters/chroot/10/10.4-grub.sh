#!/bin/bash

set -e

mountpoint /sys/firmware/efi/efivars || mount -v -t efivarfs efivarfs /sys/firmware/efi/efivars

grub-install \
  --target=x86_64-efi \
  --removable \
  --boot-directory=/boot \
  --efi-directory=/boot/efi 

BOOT_PARTITION_ID=$(blkid -s UUID -o value "$BOOT_PARTITION")
ROOT_PARTITION_PARTUUID=$(blkid -s PARTUUID -o value "$ROOT_PARTITION")
BOOT_EFI_PARTUUID=$(blkid -s PARTUUID -o value "$BOOT_EFI_PARTITION")

cat > /boot/grub/grub.cfg << EOF
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
search --set=root --fs-uuid $BOOT_PARTITION_ID

insmod efi_gop
insmod efi_uga

menuentry "GNU/Linux, Linux $KERNEL_VERSION-ft_linux" {
  linux   /$KERNEL_VMLINUZ_FILE_NAME root=PARTUUID=$ROOT_PARTITION_PARTUUID ro
}

menuentry "Firmware Setup" {
  fwsetup
}
menuentry "Shell" {
  command_line
}
# End /boot/grub/grub.cfg
EOF

# Create a seperate entry for efibootmgr
efibootmgr --create \
  --disk "$DISK" \
  --label "ft_linux EFI Boot" \
  --loader '\EFI\GRUB\grubx64.efi'