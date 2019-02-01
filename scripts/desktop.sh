#!/bin/bash

set -e
set -x

# copy all home content
cp -ra /tmp/content/home/. ~/

chmod +x ~/.scripts/*

# install xorg and i3+defaults
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps rofi

# install polybar
chmod +x ~/.config/polybar/launch.sh
trizen -S --noconfirm polybar

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

# Web Browswer
sudo pacman -S --noconfirm chromium

# install default terminal
sudo pacman -S --noconfirm termite

# install default file browser
sudo pacman -S --noconfirm nemo


# set theme (will reload with `wal -R` in .xinitrc)
wal -i /home/dev/.wallpapers/scenic.jpg
echo "cat ~/.cache/wal/sequences" >> ~/.bashrc

