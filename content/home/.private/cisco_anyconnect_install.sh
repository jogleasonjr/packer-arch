#!/bin/bash

# must be run as root
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

# echo script inline
set -x
set -x

DIR=$PWD/cisco_vpn_install
SRC=$DIR/cisco_vpn_installer.tam

rm -rf $DIR
mkdir $DIR

# download and exctract any connect client
curl https://imagefactoryassets.blob.core.windows.net/tools/4.6.03049-linux.tar -o $SRC 
tar -C $DIR -xvf $SRC

# run posture script
cd $DIR/*/posture
./posture_install.sh --no-license

# run vpn script
cd $DIR/*/vpn
mv license.txt license.txt.iagree
./vpn_install.sh

# create systemd service
cat >/etc/systemd/system/vpnagentd.service<<EOL
[Unit]
Description=Vpnagentd daemon
After=network.target
[Service]
ExecStart=/opt/cisco/anyconnect/bin/vpnagentd
Type=forking
[Install]
WantedBy=multi-user.target 
EOL

# create a bin link for dmenu, rofi, etc
rm /usr/local/bin/vpnui
ln -s /opt/cisco/anyconnect/bin/vpnui /usr/local/bin

# enable and run service
systemctl start vpnagentd.service
systemctl enable vpnagentd.service
systemctl daemon-reload

# housekeeping
rm -rf $DIR

echo "Installation done. Any above errors involving '/etc/rc.d' can be ignored since this script uses systemd. Try running 'vpnui' from a terminal."
