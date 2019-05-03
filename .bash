#!/usr/bin/env bash
ln -s ~/bash-acc/.bash
ln -s ~/bash-acc/.bashrc
ln -s ~/bash-acc/.bash_profile
ln -s ~/bash-acc/.ssh
ln -s ~/bash-acc/keys
exec /bin/bash --rcfile ~/.bashrc
exit 0
