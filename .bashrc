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
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/bin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/bin:/usr/kerberos/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/sbin:/opt/cloudian/bin:/usr/local/go/bin:$GOPATH/bin:.
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
vps-us-ny-kube-1="23.95.61.166"
vps-us-ny-kube-1p="22"
vps-us-lax-kube-2="207.228.235.252"
vps-us-lax-kube-2p="22"
vps-ger-nue-kube-3="5.189.138.17"
vps-ger-nue-kube-3p="22"
vps-us-chi-kube-4="172.245.128.49"
vps-us-chi-kube-4p="22"

### alias machines
alias _vps-us-ny-kube-1='_deploy2 "${vps-us-ny-kube-1p}" root "${vps-us-ny-kube-1}" ; _ssh2 "${vps-us-ny-kube-1}" root "${vps-us-ny-kube-1p}"'
alias _vps-us-lax-kube-2='_deploy2 "${vps-us-lax-kube-2p}" root "${vps-us-lax-kube-2}" ; _ssh2 "${vps-us-lax-kube-2}" root "${vps-us-lax-kube-2p}"'
alias _vps-ger-nue-kube-3='_deploy2 "${vps-ger-nue-kube-3p}" root "${vps-ger-nue-kube-3}" ; _ssh2 "${vps-ger-nue-kube-3}" root "${vps-ger-nue-kube-3p}"'
alias _vps-us-chi-kube-4='_deploy2 "${vps-us-chi-kube-4p}" root "${vps-us-chi-kube-4}" ; _ssh2 "${vps-us-chi-kube-4}" root "${vps-us-chi-kube-4p}"'

### help
_sshp () {
echo ""
echo -e "\e[1m_sshp:\e[0m"
echo ""
echo "_vps1"
echo "_vps2"
echo "_vps3"
echo "_vps4"
}

### Misc
export LS_OPTIONS='--color=auto'
alias ll='ls -lhF $LS_OPTIONS'
alias llt='ls -lht $LS_OPTIONS'
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

### Functions
#_specialssh () { ssh -o LogLevel=QUIET; }
_ssh1 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -X "$2"@"$1" -t "${BASH_FILER}/.bash"; _title; }
_ssh2 () { ssh -p "$3" -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/keys/id_rsa -X "$2"@"$1" -t "${BASH_FILER}/.bash"; _title; }
_sshc () { CLIENT=$1; shift; ssh -q -X root@"$CLIENT" $*; }
_rt () { eval $(ssh-agent -s); ssh-add;stty eof  '?';alias logout='kill $(echo $SSH_AGENT_PID);exit';}
_title () { echo -ne "\033]0;${USER}@${HOSTNAME}\007"; }
_deploy1 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /root/log/bash_deploy.log; }
_deploy2 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/keys/id_rsa -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /root/log/bash_deploy.log; }
_deploy3 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/keys/log-server_techsupport.pem -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /root/log/bash_deploy.log; }
_deploy4 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/keys/log-server_mklingspohn.pem -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /root/log/bash_deploy.log; }
_deploy5 () { rsync -avxL --delete -e "ssh -o LogLevel=ERROR -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /root/keys/cfn-shared.pem -p "$1"" ~/.bash* "$2"@"$3":/tmp >> /root/log/bash_deploy.log; }

_rmtracks1 () { echo "rm -rf /tmp/.bash*" | at now + 60 minutes > /dev/null 2>&1; }
_rmtracks2 () { echo "rm -rf /tmp/.bash*" | at now + 1 minute > /dev/null 2>&1; }

#_deploy () { rsync -avxL --delete -e "ssh -p "$1"" /home/pi/bash "$2"@"$3":/home/pi > /tmp/deploy.log; }
#_init () { ssh-copy-id -i ~/.ssh/id_rsa.pub "$1"@"$2" }
#_online () { nc -vzw 1 "$1" "$2" &> /dev/null
#if [ $? -eq 0 ] 
#then echo -e "\033[32mOK\033[0m"
#else echo -e "\033[31mFAILED\033[0m" 
#fi; }
#_geo () { curl ipinfo.io/""$1"" 2>/dev/null | awk -F'"' '$2=="city"{printf("%s, ", $4)}$2=="country"{print $4}'; }
#_geocountry () { curl ipinfo.io/"$1"/country; }
#_geocity () { curl ipinfo.io/"$1"/city; }
#_updated () { updated=$(sed -e '$!d' ~/bash/.update_history) ;}
#_speeded () { speeded=$(sed -e '$!d' ~/bash/.speed_history) ;}
#_speedtest () { speedtest-cli --bytes --secure; }
#_showspeed () { cat /tmp/speedtest_opt.txt ;}
#_install () { _deploy $2 pi $1 && ssh -o LogLevel=QUIET pi@$1 -p $2 -t sudo /tmp/bash/install/* ;}
_debug () {
CPU_TYPE="$(grep "physical id" /proc/cpuinfo | sort -u | wc -l) x $(grep 'cpu cores' /proc/cpuinfo | sort -u | cut -d':' -f2) Cores"
WS_TYPE="$(/usr/sbin/dmidecode|grep Product|head -1|awk '{print $3" "$4" "$5" "$6}')"
MEM="$(echo $(cat /proc/meminfo|grep MemTotal|awk '{print $2}') / 1024000 | bc) GB"
ETH_SPEED=$(/sbin/ethtool eth0 | grep "Speed" | awk '{print $2}')
MODE=$([ $(ps -ef | grep ypbind | wc -l) -eq 1 ] && echo "LDAP" || echo "NIS")
LOAD=$(uptime | cut -f5 -d":" | sed 's/^ //g')

echo -e "\n$COLOR_BLUE### | Workstation |----------------------------$COLOR_DEFAULT\n"
echo -e "Type:\t $WS_TYPE"
echo -e "CPU:\t $CPU_TYPE"
echo -e "MEM:\t $MEM"
echo -e "RHEL:\t $RHEL_VERSION"
echo -e "ETH0:\t $ETH_SPEED"
echo -e "Mode:\t $MODE"
echo -e "Load:\t $LOAD"
echo -e "\n$COLOR_BLUE### | /etc/exports |---------------------------$COLOR_DEFAULT\n"
echo -e "$(cat /etc/exports)"
echo -e "\n$COLOR_BLUE### | /etc/passwd |----------------------------$COLOR_DEFAULT\n"
echo -e "$(cat /etc/passwd | grep "+")"
echo -e "\n$COLOR_BLUE### | /etc/nsswitch.conf |---------------------$COLOR_DEFAULT\n"
echo -e "$(cat /etc/nsswitch.conf | grep -v '#')"
echo -e "\n$COLOR_BLUE### | /etc/inittab |---------------------------$COLOR_DEFAULT\n"
echo -e "$(tail -n1 /etc/inittab)"
echo -e "\n$COLOR_BLUE### | Logins |---------------------------------$COLOR_DEFAULT\n"
echo -e "$(w -sfh)"
echo -e "\n$COLOR_BLUE### | Crontab |--------------------------------$COLOR_DEFAULT\n"
echo -e "$(crontab -l)"
echo -e "\n$COLOR_BLUE### | messages |-------------------------------$COLOR_DEFAULT\n"
echo -e "$(tail -n 10 /var/log/messages)"
echo -e "\n$COLOR_BLUE### | Xorg.0.log |-----------------------------$COLOR_DEFAULT\n"
echo -e "$(tail -n 10 /var/log/Xorg.0.log)"
echo -e "\n$COLOR_BLUE### | secure |---------------------------------$COLOR_DEFAULT\n"
echo -e "$(tail -n 10 /var/log/secure)"
}
_exitstatus () { 
if [ $? == 0 ]; then
PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w$COLOR_WS $COLOR_GREY$(date +"%Y-%m-%d") \t \[\033[1;32m\]> $COLOR_DEFAULT"
else
PS1="\n$COLOR_GREY[$COLOR_USER${USER}$COLOR_GREY|$COLOR_WS${HOSTNAME}$COLOR_GREY] $COLOR_BLUE\w$COLOR_WS $COLOR_GREY$(date +"%Y-%m-%d") \t \[\033[1;31m\]> $COLOR_DEFAULT"
fi
}

## SSH command after login
if [[ "$HOSTNAME" == "access" ]] ; then
    _sshp;
elif [[ "$HOSTNAME" == "log-server" ]]; then
    _rmtracks2;
else
    echo
    _rmtracks1;
#    echo -e "   \e[4mMarvins VPS\e[0m"
#    ststatus;
#    echo
#    echo -e "   \e[4mRaspberry Pi 3\e[0m"
#    ssh -o LogLevel=QUIET pi@"${pi3}" -p "${pi3p}" -t bash/dev/open_storjshare
fi

if [ "$HOSTNAME" == "log-server" ]  && [ "$USER" == "mklingspohn" ]; then
    ### AWS stuff
    export AWS_PROFILE=mklingspohn

    ### Environments Cloud Deploy
    export TF_VAR_env=mklingspohn-1dc-711
    export TF_VAR_template=1dc
    export TF_VAR_hyperstore_version=7.1.1
    export TF_VAR_hyperstore_install=yes
    export TF_VAR_hyperstore_server_count=3

    ### SSH agent cloud deploy
    eval "$(ssh-agent -s)" >> ~/.log/ssh-agent
    /usr/bin/ssh-add ~/.ssh/cfn-shared.pem >> ~/.log/ssh-agent
    echo "" 
else
    echo
fi

### some solors
LS_COLORS=$LS_COLORS:'ln=01;37;44:di=01;33:or=05;97;100:ex=01;32;43'
export LS_COLORS

### ELK
if [ "$HOSTNAME" == "elk1" ] || [ "$HOSTNAME" == "elk2" ] || [ "$HOSTNAME" == "elk3" ]; then
  alias cl='/bin/curl -H "Content-Type: application/json" "$@"'
fi

### Wireguard VPN
if [ "$HOSTNAME" == "vpn" ] || [ "$HOSTNAME" == "vpn1" ] || [ "$HOSTNAME" == "vpn2" ]; then
  wg show
fi
