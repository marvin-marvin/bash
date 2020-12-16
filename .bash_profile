# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

# cache passphrase in session
#if [ -z "$SSH_AUTH_SOCK" ] ; then
#    eval `ssh-agent`;
#    ssh-add ~/bash-keys/acc_rsa;
#fi

# kill ssh-agent on exit
trap 'test -n "$SSH_AUTH_SOCK" && eval `/usr/bin/ssh-agent -k`' 0