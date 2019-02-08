#!/bin/bash

# must be root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


pacman -S --noconfirm python2 python2-pycups cups avahi nss-mdns ghostscript

systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service
systemctl enable avahi-daemon
systemctl start avahi-daemon

systemctl disable systemd-resolved.service
systemctl stop systemd-resolved.service

# this is a sledgehammer
# try https://unix.stackexchange.com/a/294675
usermod -a -G sys dev

# install rollo driver
wget https://www.rolloprinter.com/driver-dl/beta/rollo-driver-ubuntu_v1.0.1-beta.tar.gz 
tar -xzvf rollo-driver-ubuntu_v1.0.1-beta.tar.gz
cd rollo-driver-ubuntu_x86_64_v1.0.1/ubuntu_x86_64_v1.0.1
chmod +x install 
echo 'y' | ./install

# enable external access and sharing
cupsctl --remote-admin --remote-any --share-printers
systemctl restart org.cups.cupsd.service

cd ~
wget https://raw.githubusercontent.com/jogleasonjr/airprint-generate/master/airprint-generate.py

# manual
# DON'T ADD MULTIPLE PRINTERS OF MORE THAN ONE TYPE (e.g. a label printer with two different sizes)
# 1. go to <ip>:631 and add printers from usb or other cups servers
# 2. rm -rf /etc/avahi/services
# 3. python2 airprint-generate.py -d /etc/avahi/services