#!/bin/bash

set -e
set -x

# for basic vmware functionality
sudo pacman -S --noconfirm open-vm-tools

# for screen resizing
sudo pacman -S --noconfirm xf86-input-vmmouse xf86-video-vmware mesa

# for copy/paste
sudo pacman -S --noconfirm gtkmm3

# these services must be running for the above vmware utilities to work
sudo systemctl enable vmtoolsd
sudo systemctl enable vmware-vmblock-fuse

# startup the guest tools when the user starts X
# this line just replaces "#GUEST_TOOLS_HERE" with "vmware-user" in .xinitrc
sed -i '/#GUEST_TOOLS_HERE/c vmware-user' ~/.xinitrc