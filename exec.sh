### insert command to execute
#uptime ; free -h ; ping -c 3 google.com
# ./speedtest --bytes --simple
#/bin/wget -q https://gist.githubusercontent.com/marvin-marvin/ba839de656c98fa3eb7ac5685f99327c/raw/crontab.txt -O /tmp/crontab ; /usr/bin/crontab /tmp/crontab ; rm /tmp/crontab
#nano /etc/wireguard/wg0.conf
#systemctl daemon-reload
#if [[ "$HOSTNAME" == "ds-ger-bs-kube-250" ]] ; then mkdir -p /root/k8s-cfg && cd /root/k8s-cfg && /bin/git add -A && /bin/git commit -m "update" && /bin/git push --force origin master && cd ; elif [[ "$HOSTNAME" == "vps-ger-fra-1" ]] || [[ "$HOSTNAME" == "vps-us-ny-kube-1" ]] || [[ "$HOSTNAME" == "vps-us-lax-kube-2" ]] || [[ "$HOSTNAME" == "vps-ger-nue-kube-3" ]] || [[ "$HOSTNAME" == "vps-us-chi-kube-4" ]] || [[ "$HOSTNAME" == "ds-ger-bs-kube-100" ]] ; then mkdir -p /root/k8s-cfg && cd /root/k8s-cfg && /bin/git fetch --all && /bin/git checkout --force "origin/master" && cd ; else : ; fi
#if [[ "$HOSTNAME" == "ds-ger-bs-kube-100" ]] ; then /bin/wget -q https://gist.githubusercontent.com/marvin-marvin/485ab9222c0a892826b1a958180d07f1/raw/pulseway_config_ds.xml -O /etc/pulseway/pulseway_config.xml && /bin/cat /etc/pulseway/token /etc/pulseway/pulseway_config.xml > /etc/pulseway/out && /bin/mv /etc/pulseway/out /etc/pulseway/config.xml ; elif [[ "$HOSTNAME" == "vps-us-ny-kube-1" ]] || [[ "$HOSTNAME" == "vps-us-lax-kube-2" ]] || [[ "$HOSTNAME" == "vps-ger-nue-kube-3" ]] || [[ "$HOSTNAME" == "vps-us-chi-kube-4" ]] ; then /bin/wget -q https://gist.githubusercontent.com/marvin-marvin/d03704307bb9dfa5f8df733668e6f0df/raw/pulseway_config_vps.xml -O /etc/pulseway/pulseway_config.xml && /bin/cat /etc/pulseway/token /etc/pulseway/pulseway_config.xml > /etc/pulseway/out && /bin/mv /etc/pulseway/out /etc/pulseway/config.xml ; else : ; fi
#systemctl stop pulseway ; sleep 3 ; systemctl start pulseway ; sleep 3 ; systemctl status pulseway


#systemctl restart wg-quick@wg0 ; sleep 3 ; systemctl status wg-quick@wg0

#yum update -y
#reboot

crontab -l
cat ~/k8s-cfg/pihole/pihole/lan.list

### EOF