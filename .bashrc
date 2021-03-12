#!/usr/bin/env bash

# locale
export LC_ALL="en_US.UTF-8"

# alias sharing
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

# check winsize
shopt -s checkwinsize

# kein Error bei rsync
[[ $- != *i* ]] && return

umask 0002

# Docker login fix
export DOCKER_CLI_EXPERIMENTAL=enabled

# exports
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

# color prompt
unset LS_COLORS
unset TZ
COLOR_DEFAULT="\[\e[0m\]"
COLOR_YELLOW="\[\033[1;33m\]"
COLOR_BLUE="\[\033[1;34m\]"
COLOR_GREY="\[\033[1;33m\]"

# user definitions
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

# hostname color
case ${HOSTNAME} in
vps-ger-nue-kube-1)
# red
COLOR_WS="\[\033[1;31m\]"
;;
*esxi*)
# light blue
COLOR_WS="\[\033[1;36m\]"
;;
*aspberrypi)
# green
COLOR_WS="\[\033[1;32m\]"
;;
*)
# yellow
COLOR_WS="\[\033[1;33m\]"
;;
esac

# update window title
echo -ne "\033]0;${USER}@${HOSTNAME}\007"

# machines
kube1="10.0.0.1"
kube1_p="52817"
kube2="10.0.0.2"
kube2_p="52817"
kube3="10.0.0.3"
kube3_p="52817"
kube4="10.0.0.4"
kube4_p="52817"
kube5="10.0.0.5"
kube5_p="52817"
kube6="10.0.0.6"
kube6_p="52817"
pi='192.168.1.240'
pi_p='52817'

# alias machines
alias _kube1='_deploy "${kube1_p}" root "${kube1}" ; _ssh "${kube1}" root "${kube1_p}"'
alias _kube2='_deploy "${kube2_p}" root "${kube2}" ; _ssh "${kube2}" root "${kube2_p}"'
alias _kube3='_deploy "${kube3_p}" root "${kube3}" ; _ssh "${kube3}" root "${kube3_p}"'
alias _kube4='_deploy "${kube4_p}" root "${kube4}" ; _ssh "${kube4}" root "${kube4_p}"'
alias _kube5='_deploy "${kube5_p}" root "${kube5}" ; _ssh "${kube5}" root "${kube5_p}"'
alias _kube6='_deploy "${kube6_p}" root "${kube6}" ; _ssh "${kube6}" root "${kube6_p}"'
alias _pi='_deploy "${pi_p}" pi "${pi}" ; _ssh "${pi}" pi "${pi_p}"'

# summary
_load () {
clear
echo ""
echo -e "\e[1mhosts:\e[0m"
echo ""
echo "_kube1  - vps-ger-nue-kube-1"
echo "_kube2  - vps-nl-ams-kube-2"
echo "_kube3  - vps-us-atl-kube-3"
echo "_kube4  - esxi-ger-bs-kube-4"
echo "_kube5  - esxi-ger-bs-kube-5"
echo "_kube6  - esxi-ger-bs-kube-6"
echo ""
echo "_pi"
echo ""
echo "******************************"
echo ""
echo -e "\e[1mcmds:\e[0m"
echo ""
echo "llapi"
echo "llapi_emea"
echo "papi"
echo ""
echo "******************************"
echo ""
echo "Shell No:" $SHLVL
echo ""
}

_tmux () {
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  tmux attach || tmux new
fi
}

# misc
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

# functions

_ssh () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/client_rsa -X "$2"@"$1" -t "${BASH_FILER}/.bash" 2> /dev/null ; _title; }
_title () { echo -ne "\033]0;${USER}@${HOSTNAME}\007"; }
_deploy () { rsync -avxL --delete --exclude '.bash_sessions' --exclude '.bash_history' -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.ssh/client_rsa -p "$1"" ~/bash/.bash* "$2"@"$3":${BASH_FILER} > /dev/null; }

# mkdir + cd into
function md
{
  command mkdir $1 && cd $1
}

# I'm a ghost
_rmtracks1 () { echo "rm -rf /tmp/.bash*" | at now + 60 minutes > /dev/null 2>&1; }
_rmtracks2 () { echo "rm -rf /tmp/.bash*" | at now + 1 minute > /dev/null 2>&1; }

_exitstatus () { 
if [[ "$HOSTNAME" == "vps-ger-nue-kube-1" ]] ; then
  PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w \t \[\033[1;32m\]>$COLOR_DEFAULT $(kube_ps1) "
elif [ $? == 0 ]; then
  PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w$COLOR_WS $COLOR_GREY$(date +"%Y-%m-%d") \t \[\033[1;32m\]> $COLOR_DEFAULT"
else
  PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w$COLOR_WS $COLOR_GREY$(date +"%Y-%m-%d") \t \[\033[1;31m\]> $COLOR_DEFAULT"
fi
}

# SSH command after login
if [[ "$HOSTNAME" == "vps-ger-nue-kube-1" ]] ; then
  source <(kubectl completion bash)
  source /etc/profile.d/bash_completion.sh
  source ~/kube-ps1/kube-ps1.sh
  #PS1='[\u@\h \W $(kube_ps1)]\$ '
  KUBE_PS1_SYMBOL_USE_IMG=true
  command -v kubecolor >/dev/null 2>&1 && alias kubectl="kubecolor --force-colors"
  # if does not work, install it first
  # go get -u github.com/dty1er/kubecolor/cmd/kubecolor
  complete -F __start_kubectl k
  complete -o default -F __start_kubectl k
  alias k='kubectl'
  alias kgn='kubectl get nodes --sort-by=.metadata.creationTimestamp'
    kubectl api-resources
    echo ""
    echo ""
    _tmux
    _load
    echo ""
    kubectl cluster-info | head -n -2
    echo ""
    kubectl get nodes --sort-by=.metadata.creationTimestamp
    echo ""
    kubectl get -A pods
    echo ""
    kubectl get -A svc
    echo ""
    else
      :
fi

#EOF

### idea section

# some colors (enable if available on ssh host)
#LS_COLORS=$LS_COLORS:'ln=01;37;44:di=01;33:or=05;97;100:ex=01;32;43'
#export LS_COLORS

# ssh without key
#_ssh1 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -X "$2"@"$1" -t "${BASH_FILER}/.bash" 2> /dev/null ; _title ; }

# deploy without ssh key
#_deploy1 () { rsync -avxL --delete --exclude '.bash_sessions' --exclude '.bash_history' -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p "$1"" ~/bash-acc/.bash* "$2"@"$3":${BASH_FILER} > /dev/null; }

# execute on target
#_execute () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/bash-keys/acc_rsa -X "$2"@"$1" -t "chmod +x ${BASH_FILER}/exec.sh ; ${BASH_FILER}/exec.sh" 2> /dev/null ; _title ; }

# execute command on every node - single
#alias _exec1='echo ; echo -e "\e[1;7mvps-us-ny-kube-1\e[0m" ; _deploy2 "${vpsusnykube1p}" root "${vpsusnykube1}" ; _execute "${vpsusnykube1}" root "${vpsusnykube1p}" ; echo'
#alias _exec2='echo ; echo -e "\e[1;7mvps-us-lax-kube-2\e[0m" ; _deploy2 "${vpsuslaxkube2p}" root "${vpsuslaxkube2}" ; _execute "${vpsuslaxkube2}" root "${vpsuslaxkube2p}" ; echo'
#alias _exec3='echo ; echo -e "\e[1;7mvps-ger-nue-kube-3\e[0m" ; _deploy2 "${vpsgernuekube3p}" root "${vpsgernuekube3}" ; _execute "${vpsgernuekube3}" root "${vpsgernuekube3p}" ; echo'
#alias _exec4='echo ; echo -e "\e[1;7mvps-us-chi-kube-4\e[0m" ; _deploy2 "${vpsuschikube4p}" root "${vpsuschikube4}" ; _execute "${vpsuschikube4}" root "${vpsuschikube4p}" ; echo'
#alias _exec100='echo ; echo -e "\e[1;7mds-ger-bs-kube-100\e[0m" ; _deploy2 "${dsgerbskube100p}" root "${dsgerbskube100}" ; _execute "${dsgerbskube100}" root "${dsgerbskube100p}" ; echo'
#alias _exec200='echo ; echo -e "\e[1;7mvps-ger-bs-kubectl-200\e[0m" ; _deploy2 "${vpsgerbskubectl200p}" root "${vpsgerbskubectl200}" ; _execute "${vpsgerbskubectl200}" root "${vpsgerbskubectl200p}" ; echo'
#alias _exec250='echo ; echo -e "\e[1;7mds-ger-bs-kube-250\e[0m" ; _deploy2 "${dsgerbskube250p}" root "${dsgerbskube250}" ; _execute "${dsgerbskube250}" root "${dsgerbskube250p}" ; echo'
#alias _exec='_exec1 ; _exec2 ; _exec3 ; _exec4 ; _exec100'

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

# SSH command after login
#if [[ "$HOSTNAME" == "vps-ger-nue-kube-1" ]] ; then
#    source ~/ssh-find-agent/ssh-find-agent.sh
#    echo ""
#    set_ssh_agent_socket
# k8s stuff
#source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
#source /etc/profile.d/bash_completion.sh
#alias k=kubectl
#complete -F __start_kubectl k
#    _tmux
#    _load
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
