#!/bin/bash

set -e
set -x

packer build --only=vmware-iso templates\archlinux-x86_64.json
