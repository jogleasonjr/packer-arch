#!/bin/bash

set -e
set -x

if [ "$PACKER_BUILDER_TYPE" != "vmware-iso" ]; then
  exit 0
fi

# install xorg and i3+defaults
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps i3status dmenu
# set up `startx`
cp /tmp/content/home/.xinitrc /home/dev/.xinitrc
# copy i3 config
mkdir -p /home/dev/.config/i3 && cp /tmp/content/home/.config/i3/config "$_/config"

# install default terminal
sudo pacman -S --noconfirm termite

# install default file browser
sudo pacman -S --noconfirm nemo

# install default fonts
sudo pacman -S --noconfirm ttf-dejavu ttf-font-awesome
# ttf-ubuntu-font-family
# ttf-font-awesome
# ttf-mplus
# ttf-dejavu
# ttf-fira-mono
# ttf-fira-sans
# sudo pacman -S --noconfirm openbox obconf lxappearance-obconf openbox-themes