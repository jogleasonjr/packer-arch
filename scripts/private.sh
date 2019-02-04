#!/bin/bash

set -x
set -e

# call .private setup scripts, if any. these will have been copied to /tmp.
# this folder isn't checked into source control. it's used for ssh keys and
# other private endeavors.

PVT="/tmp/content/.private/setup.sh"

if [ -e "$PVT" ]; then
    echo "Private setup script found, executing..."
    source $PVT
else 
    echo "Private setup script not found."
fi 