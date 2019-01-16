#!/bin/bash

set -e
set -x

# install xorg and i3+defaults
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps i3status rofi
# set up `startx`
cp /tmp/content/home/.xinitrc /home/dev/.xinitrc
# copy i3 config
mkdir -p /home/dev/.config/i3 && cp /tmp/content/home/.config/i3/config "$_/config"

# install compositor and background image utility
sudo pacman -S --noconfirm compton feh
