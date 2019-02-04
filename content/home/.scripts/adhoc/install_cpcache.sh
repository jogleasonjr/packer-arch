#!/bin/bash

set -x
set -e

trizen -S --noconfirm cpcache-git

systemctl start cpcache.service
systemctl enable cpcache.service