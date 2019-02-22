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





# automatically run a script when user resizes the window
sudo mkdir /usr/local/bin/xeventbind
git clone https://github.com/jogleasonjr/xeventbind.git /usr/local/bin/xeventbind
cd /usr/local/bin/xeventbind
make

# startup the guest tools when the user starts X
# this line just replaces "#RESIZE_TOOLS_HERE" with a resize script in .xinitrc
sed -i '/#RESIZE_TOOLS_HERE/c /usr/local/bin/xeventbind/xeventbind resolution ~/.scripts/resize_vm.sh' ~/.xinitrc &