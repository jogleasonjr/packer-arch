#!/bin/bash

set -e
set -x

# dotnet sdk and visual studio code
sudo pacman -S --noconfirm dotnet-sdk code

# install azure cli tools
trizen -S --noconfirm python-azure-cli

# opt out of telemetry
echo "export DOTNET_CLI_TELEMETRY_OPTOUT=1" >> ~/.bashrc