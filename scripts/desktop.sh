#!/bin/bash

set -e
set -x

# copy all home content
cp -ra /tmp/content/home/. ~/

# install xorg and i3+defaults
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps i3status rofi

# install compositor and background image utilities
sudo pacman -S --noconfirm compton feh python-pywal

# theme tooling
sudo pacman -S --noconfirm arc-gtk-theme arc-icon-theme lxappearance 

# install fonts
sudo pacman -S --noconfirm ttf-dejavu ttf-font-awesome
trizen -S --noconfirm ttf-mononoki
# ttf-ubuntu-font-family
# ttf-font-awesome
# ttf-mplus
# ttf-dejavu
# ttf-fira-mono
# ttf-fira-sans

# set theme (will reload with `wal -R` in .xinitrc)
wal -i /home/dev/wallpapers/scenic.jpg
echo "cat ~/.cache/wal/sequences" >> ~/.bashrc