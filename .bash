#!/usr/bin/env bash

if [[ "$HOSTNAME" == "vps-ger-fra-1" ]] ; then
    exec /bin/bash --rcfile ~/.bashrc
else
    exec /bin/bash --rcfile /tmp/.bashrc
fi

exit 0
