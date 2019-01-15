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

# copy wallpaper
mkdir -p /home/dev/wallpapers && cp /tmp/content/home/wallpapers/lhbw.jpg "$_/background.jpg"

# install default fonts
sudo pacman -S --noconfirm ttf-dejavu ttf-font-awesome ttf-fira-mono ttf-fira-sans ttf-fira-code
# ttf-ubuntu-font-family
# ttf-font-awesome
# ttf-mplus
# ttf-dejavu
# ttf-fira-mono
# ttf-fira-sans

# copy termite theme
mkdir -p /home/dev/.config/termite && cp /tmp/content/home/.config/termite/config "$_"