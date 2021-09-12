#!/usr/bin/env bash
if [[ "$HOSTNAME" == "VPS-Dev-Go" ]] ; then
    exec /bin/bash --rcfile ~/.bashrc
else
    exec /bin/bash --rcfile /tmp/.bashrc
fi
exit 0
