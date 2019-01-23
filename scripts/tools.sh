#!/bin/bash

set -e
set -x

# Basic tooling
sudo pacman -S --noconfirm vim git

# Install trizen (AUR helper)
mkdir -p /home/dev/git && cd $_
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg --noconfirm -si

# Web Browswer
sudo pacman -S --noconfirm chromium

# install default terminal
sudo pacman -S --noconfirm termite

# install default file browser
sudo pacman -S --noconfirm nemo
