#!/bin/bash

set -e
set -x

# basic audio services
sudo pacman -S --noconfirm pulseaudio pulseaudio-alsa alsa-utils

# enable audio service
systemctl --user enable pulseaudio

# unmute master
# amixer -D pulse sset Master toggle

# cli music player
sudo pacman -S --noconfirm mps-youtube mpv

# spectrum analyzer
trizen -S --noconfirm cava