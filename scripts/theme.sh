#!/bin/bash

set -e
set -x

sudo pacman -S --noconfirm arc-gtk-theme arc-icon-theme lxappearance 

# GTK 3 settings
mkdir -p /home/dev/.config/gtk-3.0 && cp /tmp/content/home/.config/gtk-3.0/settings.ini "$_"

# GTK 2 settings
cp /tmp/content/home/.gtkrc-2.0 /home/dev/ 

# Icon settings
mkdir -p /home/dev/.icons/default && cp /tmp/content/home/.icons/default/index.theme "$_"