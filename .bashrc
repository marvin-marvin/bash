#!/usr/bin/env bash

# locale
export LC_ALL="en_US.UTF-8"

### Alias sharing
shopt -s expand_aliases

# history add date
HISTTIMEFORMAT='%F %T '

# bash 4 recursive only on version >4.0
shopt -s globstar

# add history instead of replacing it
shopt -s histappend

# store big oneliner in one line
shopt -s cmdhist

# save history after every command
PROMPT_COMMAND='history -a'

# bigger history
HISTFILESIZE=1000000
HISTSIZE=1000000

# history ignore dups and spaces
HISTCONTROL=ignoreboth

# history ignroe commands
HISTIGNORE='ls:bg:fg:history'

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
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin:/usr/kerberos/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/sbin:/go/bin:/usr/local/go/bin:$GOPATH/bin:.
export SHELL=/bin/bash

export EDITOR="/usr/bin/nano"
export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export ARCH=$(uname -m)

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

### Hostname color
case ${HOSTNAME} in
DevBox)
# green
COLOR_WS="\[\033[1;32m\]"
;;
*kube*)
# light blue
COLOR_WS="\[\033[1;36m\]"
;;
*)
# yellow
COLOR_WS="\[\033[1;33m\]"
;;
esac

### Update Window Title
echo -ne "\033]0;${USER}@${HOSTNAME}\007"

### machines
kube1="192.168.1.211"
kube1_p="22"
kube2="192.168.1.212"
kube2_p="22"
kube3="192.168.1.213"
kube3_p="22"

### alias machines
alias _kube1='_deploy2 "${kube1_p}" root "${kube1}" ; _ssh2 "${kube1}" root "${kube1_p}"'
alias _kube2='_deploy2 "${kube2_p}" root "${kube2}" ; _ssh2 "${kube2}" root "${kube2_p}"'
alias _kube3='_deploy2 "${kube3_p}" root "${kube3}" ; _ssh2 "${kube3}" root "${kube3_p}"'

# execute command on every node - single
alias _exec1='echo ; echo -e "\e[1;7mvps-us-ny-kube-1\e[0m" ; _deploy2 "${vpsusnykube1p}" root "${vpsusnykube1}" ; _execute "${vpsusnykube1}" root "${vpsusnykube1p}" ; echo'
alias _exec2='echo ; echo -e "\e[1;7mvps-us-lax-kube-2\e[0m" ; _deploy2 "${vpsuslaxkube2p}" root "${vpsuslaxkube2}" ; _execute "${vpsuslaxkube2}" root "${vpsuslaxkube2p}" ; echo'
alias _exec3='echo ; echo -e "\e[1;7mvps-ger-nue-kube-3\e[0m" ; _deploy2 "${vpsgernuekube3p}" root "${vpsgernuekube3}" ; _execute "${vpsgernuekube3}" root "${vpsgernuekube3p}" ; echo'
alias _exec4='echo ; echo -e "\e[1;7mvps-us-chi-kube-4\e[0m" ; _deploy2 "${vpsuschikube4p}" root "${vpsuschikube4}" ; _execute "${vpsuschikube4}" root "${vpsuschikube4p}" ; echo'
alias _exec100='echo ; echo -e "\e[1;7mds-ger-bs-kube-100\e[0m" ; _deploy2 "${dsgerbskube100p}" root "${dsgerbskube100}" ; _execute "${dsgerbskube100}" root "${dsgerbskube100p}" ; echo'
#alias _exec200='echo ; echo -e "\e[1;7mvps-ger-bs-kubectl-200\e[0m" ; _deploy2 "${vpsgerbskubectl200p}" root "${vpsgerbskubectl200}" ; _execute "${vpsgerbskubectl200}" root "${vpsgerbskubectl200p}" ; echo'
#alias _exec250='echo ; echo -e "\e[1;7mds-ger-bs-kube-250\e[0m" ; _deploy2 "${dsgerbskube250p}" root "${dsgerbskube250}" ; _execute "${dsgerbskube250}" root "${dsgerbskube250p}" ; echo'
alias _exec='_exec1 ; _exec2 ; _exec3 ; _exec4 ; _exec100'

# k8s stuff
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
source /etc/profile.d/bash_completion.sh
alias k=kubectl
complete -F __start_kubectl k

### help
_sshp () {
clear
echo ""
echo -e "\e[1m_sshp:\e[0m"
echo ""
echo "_kube1"
echo "_kube2"
echo "_kube3"
echo ""
echo "_exec - execute sh"
echo "_deploy1 <port> root <host>"
echo "_ssh1 <host> root <port>"
echo "transfer <file>"
echo ""
echo "Shell No:" $SHLVL
echo ""
}

### Misc
export LS_OPTIONS='--color=auto'
alias ll='ls -lhF $LS_OPTIONS'
alias llt='ls -lht $LS_OPTIONS'
alias llr='ls -lhtr $LS_OPTIONS'
alias lla='ls -alF $LS_OPTIONS'
alias la='ls -A $LS_OPTIONS'
alias l='ls -CF $LS_OPTIONS'
alias ls='ls $LS_OPTIONS'
alias tailf='tail -f'
alias tail1='tail -n100'
alias tail2='tail -n200'
alias tail5='tail -n500'
alias su='echo $DISPLAY; xauth list; su'
alias cls='clear'
alias clh='history -c'
PROMPT_COMMAND=_exitstatus

# transfer.sh upload / transfer hello.txt 
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

### Functions
_ssh1 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -X "$2"@"$1" -t "${BASH_FILER}/.bash" 2> /dev/null ; _title ; }
_ssh2 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/bash-keys/client_rsa -X "$2"@"$1" -t "${BASH_FILER}/.bash" 2> /dev/null ; _title; }
#_ssh2 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/bash-keys/acc_rsa -X "$2"@"$1" -t "${BASH_FILER}/.bash" 2> /dev/null ; _title ; }
_title () { echo -ne "\033]0;${USER}@${HOSTNAME}\007"; }
_deploy1 () { rsync -avxL --delete --exclude '.bash_sessions' --exclude '.bash_history' -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p "$1"" ~/bash-acc/.bash* "$2"@"$3":${BASH_FILER} > /dev/null; }
_deploy2 () { rsync -avxL --delete --exclude '.bash_sessions' --exclude '.bash_history' -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/bash-keys/client_rsa -p "$1"" ~/bash-dev/.bash* "$2"@"$3":${BASH_FILER} > /dev/null; }
#_deploy2 () { rsync -avxL --delete --exclude '.bash_sessions' --exclude '.bash_history' -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/bash-keys/acc_rsa -p "$1"" ~/bash-acc/.bash* ~/exec.sh "$2"@"$3":${BASH_FILER} > /dev/null; }
_execute () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/bash-keys/acc_rsa -X "$2"@"$1" -t "chmod +x ${BASH_FILER}/exec.sh ; ${BASH_FILER}/exec.sh" 2> /dev/null ; _title ; }

# mkdir + cd into
function md
{
  command mkdir $1 && cd $1
}

# I'm a ghost
_rmtracks1 () { echo "rm -rf /tmp/.bash*" | at now + 60 minutes > /dev/null 2>&1; }
_rmtracks2 () { echo "rm -rf /tmp/.bash*" | at now + 1 minute > /dev/null 2>&1; }

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

## SSH command after login - devbox
if [[ "$HOSTNAME" == "DevBox" ]] ; then
#    source ~/ssh-find-agent/ssh-find-agent.sh
#    echo ""
#    set_ssh_agent_socket
    _sshp
    else
       :
fi

#if [[ "$HOSTNAME" == "ds-ger-bs-kube-100" ]] ; then
#    clear
#    echo ""
#    kubectl cluster-info | head -n -2
#    echo ""
#    kubectl get nodes
#    echo ""
#    kubectl get pods --all-namespaces
#    echo ""
#    kubectl get svc --all-namespaces
#    echo ""
#    else
#       :
#fi

#if [[ "$HOSTNAME" == "ds-ger-bs-kube-100" ]] ; then
#    echo ""
#    virsh list --all
#    else
#       :
#fi
