#!/bin/bash

set -x
set -e

# must be root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

trizen -S --noconfirm cpcache-git

systemctl start cpcache.service
systemctl enable cpcache.service