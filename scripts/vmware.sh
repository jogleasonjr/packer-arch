#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

# for basic vmware functionality
sudo pacman -S --noconfirm open-vm-tools

# for screen resizing
sudo pacman -S --noconfirm xf86-input-vmmouse xf86-video-vmware mesa

# for copy/paste
sudo pacman -S --noconfirm gtkmm3

# these services must be running for the above vmware utilities to work
sudo systemctl enable vmtoolsd
sudo systemctl enable vmware-vmblock-fuse

sudo mkdir -p /mnt/hgfs