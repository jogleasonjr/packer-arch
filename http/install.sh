#!/bin/bash

set -e
set -x

if [ -e /dev/vda ]; then
  device=/dev/vda
elif [ -e /dev/sda ]; then
  device=/dev/sda
else
  echo "ERROR: There is no disk available for installation" >&2
  exit 1
fi
export device

memory_size_in_kilobytes=$(free | awk '/^Mem:/ { print $2 }')
swap_size_in_kilobytes=$((memory_size_in_kilobytes * 2))
sfdisk "$device" <<EOF
label: dos
size=${swap_size_in_kilobytes}KiB, type=82
                                   type=83, bootable
EOF
mkswap "${device}1"
mkfs.ext4 "${device}2"
mount "${device}2" /mnt

curl -fsS https://www.archlinux.org/mirrorlist/?country=US > /tmp/mirrorlist
grep '^#Server' /tmp/mirrorlist | sort -R | head -n 50 | sed 's/^#//' > /etc/pacman.d/mirrorlist
sed -i '1iServer = http://192.168.26.134:7070/$repo/os/$arch' /etc/pacman.d/mirrorlist

pacman -Sy --noconfirm
pacman -S reflector --noconfirm
reflector --verbose --country US --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

sed -i '1iServer = http://192.168.26.134:7070/$repo/os/$arch' /etc/pacman.d/mirrorlist
pacman -Sy --noconfirm
pacstrap /mnt base base-devel grub openssh sudo

swapon "${device}1"
genfstab -p /mnt >> /mnt/etc/fstab
swapoff "${device}1"

arch-chroot /mnt /bin/bash