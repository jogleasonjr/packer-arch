#!/bin/bash

set -e
set -x

# basic audio services
sudo pacman -S --noconfirm pulseaudio pulseaudio-alsa alsa-utils

# cli music player
sudo pacman -S --noconfirm mps-youtube mpv

# spectrum analyzer
trizen -S --noconfirm cava