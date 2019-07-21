#!/bin/bash

set -e
set -x

# for basic qemu functionality
sudo pacman -S --noconfirm qemu-guest-agent

sudo systemctl enable qemu-ga
sudo systemctl start qemu-ga
