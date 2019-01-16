#!/bin/bash

set -e
set -x

sudo pacman -S --noconfirm virtualbox-guest-utils virtualbox-guest-modules-arch
sudo systemctl enable vboxservice