#!/bin/bash

set -e
set -x

# install docker
sudo pacman -S --noconfirm docker docker-compose

# enable service
sudo systemctl enable docker

# add user to docker group so we don't need sudo
sudo usermod -a -G docker $USER