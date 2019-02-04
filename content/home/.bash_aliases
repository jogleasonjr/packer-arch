#!/bin/bash

alias day=~/.scripts/day.sh
alias night=~/.scripts/night.sh
alias mx=~/.scripts/mx.sh

alias fing="trizen --noconfirm"

# make a nested dir and CD into it
mk()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}