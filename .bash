#!/usr/bin/env bash
if [[ "$HOSTNAME" == "DevBox" ]] ; then
    exec /bin/bash --rcfile ~/.bashrc
else
    exec /bin/bash --rcfile /tmp/.bashrc
fi
exit 0
