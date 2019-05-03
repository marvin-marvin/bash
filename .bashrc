#!/usr/bin/env bash

### Alias sharing
shopt -s expand_aliases

### bash 4 recursive
shopt -s globstar

### check winsize
shopt -s checkwinsize

### kein Error bei rsync
[[ $- != *i* ]] && return

umask 0002

### Exports
export BASH_FILER="/tmp"
export HISTSIZE=100000
export history_control=ignoredups
export MANPAGER=nano
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin:/usr/kerberos/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/sbin:/usr/local/go/bin:$GOPATH/bin:.
export SHELL=/bin/bash
export EDITOR="/usr/bin/nano"
export GOPATH=$HOME/go

### Color Prompt
unset LS_COLORS
unset TZ
COLOR_DEFAULT="\[\e[0m\]"
COLOR_YELLOW="\[\033[1;33m\]"
COLOR_BLUE="\[\033[1;34m\]"
COLOR_GREY="\[\033[1;33m\]"

### User definition
case ${USER} in
root)
# red
COLOR_USER="\[\033[1;31m\]"
;;
*)
# light blue
COLOR_USER="\[\033[1;36m\]"
;;
esac

case ${HOSTNAME} in
vps*)
# green
COLOR_WS="\[\033[1;32m\]"
;;
*)
# light blue
COLOR_WS="\[\033[1;36m\]"
;;
esac

### Update Window Title
echo -ne "\033]0;${USER}@${HOSTNAME}\007"

### machines
vpsusnykube1="23.95.61.166"
vpsusnykube1p="22"
vpsuslaxkube2="207.228.235.252"
vpsuslaxkube2p="22"
vpsgernuekube3="5.189.138.17"
vpsgernuekube3p="22"
vpsuschikube4="172.245.128.49"
vpsuschikube4p="22"

### alias machines
# vps-us-ny-kube-1
alias _vps1='_deploy2 "${vpsusnykube1p}" root "${vpsusnykube1}" ; _ssh2 "${vpsusnykube1}" root "${vpsusnykube1p}"'

# vps-us-lax-kube-2
alias _vps2='_deploy2 "${vpsuslaxkube2p}" root "${vpsuslaxkube2}" ; _ssh2 "${vpsuslaxkube2}" root "${vpsuslaxkube2p}"'

# vps-ger-nue-kube-3
alias _vps3='_deploy2 "${vpsgernuekube3p}" root "${vpsgernuekube3}" ; _ssh2 "${vpsgernuekube3}" root "${vpsgernuekube3p}"'

# vps-us-chi-kube-4
alias _vps4='_deploy2 "${vpsuschikube4p}" root "${vpsuschikube4}" ; _ssh2 "${vpsuschikube4}" root "${vpsuschikube4p}"'

# other
alias _other='echo "_deploy1 <port> root <host> OR _ssh1 <host> root <port>"'

### help
_sshp () {
echo ""
echo -e "\e[1m_sshp:\e[0m"
echo ""
echo "_vps1 - vps-us-ny-kube-1"
echo "_vps2 - vps-us-lax-kube-2"
echo "_vps3 - vps-ger-nue-kube-3"
echo "_vps4 - vps-us-chi-kube-4"
echo ""
echo "_other"
}

### Misc
export LS_OPTIONS='--color=auto'
alias ll='ls -lhF $LS_OPTIONS'
alias llt='ls -lht $LS_OPTIONS'
alias lla='ls -alF $LS_OPTIONS'
alias ls='ls $LS_OPTIONS'
alias tailf='tail -f'
alias tail1='tail -n100'
alias tail2='tail -n200'
alias tail5='tail -n500'
alias su='echo $DISPLAY; xauth list; su'
alias cls='clear'
alias clh='history -c'
PROMPT_COMMAND=_exitstatus

### Functions
_ssh1 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -X "$2"@"$1" -t "${BASH_FILER}/.bash"; _title; }
_ssh2 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa -X "$2"@"$1" -t "${BASH_FILER}/.bash"; _title; }
_title () { echo -ne "\033]0;${USER}@${HOSTNAME}\007"; }
_deploy1 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /tmp/bash_deploy.log; }
_deploy2 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /tmp/bash_deploy.log; }

_exitstatus () { 
if [ $? == 0 ]; then
PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w$COLOR_WS $COLOR_GREY$(date +"%Y-%m-%d") \t \[\033[1;32m\]> $COLOR_DEFAULT"
else
PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w$COLOR_WS $COLOR_GREY$(date +"%Y-%m-%d") \t \[\033[1;31m\]> $COLOR_DEFAULT"
fi
}

### some solors
LS_COLORS=$LS_COLORS:'ln=01;37;44:di=01;33:or=05;97;100:ex=01;32;43'
export LS_COLORS

## SSH command after login - access
if [[ "$HOSTNAME" == "vps-ger-fra-1" ]] ; then
    _sshp;
fi
