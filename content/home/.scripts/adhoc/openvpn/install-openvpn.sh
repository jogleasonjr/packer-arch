#!/bin/bash

set -e
set -x

# must be root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install openvpn
sudo pacman -S --noconfirm openvpn

# DNS is goofy with openvpn as noted here: https://wiki.archlinux.org/index.php/OpenVPN#Update_resolv-conf_script
# this script places the above executable in the correct location
chmod +x $DIR/update-resolv-conf.sh
yes | cp -rf $DIR/update-resolv-conf.sh /etc/openvpn/

printf "** IMPORTANT **
append the following three lines to your openvpn config file for DNS to refresh when the vpn tunnel goes up and down:
   script-security 2
   up /etc/openvpn/update-resolv-conf.sh
   down /etc/openvpn/update-resolv-conf.sh
"
