#!/bin/bash

set -e
set -x

packer build --only=vmware-iso-desktop templates\archlinux-x86_64.json
