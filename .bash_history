systemctl status sshd
yum update
yum -y update ; yum -y install epel-release iperf3 openssh openssh-server openssh-clients openssl-libs iftop wget htop rsync ntpdate ntp git yum-cron net-tools bind-utils which make nload nano ncdu mc iftop dnsutils htop
systemctl enable ntpd ; systemctl start ntpd ; timedatectl set-timezone Europe/Berlin
timedatectl
mv -f /etc/yum/yum-cron.conf /etc/yum/yum-cron.conf.bak ; nano /etc/yum/yum-cron.conf
systemctl start yum-cron ; systemctl enable yum-cron
systemctl status sshd
systemctl enable sshd
reboot
ll
mkdir log
ll
cls
ll
_dock1
ll
cd keys/
ll
cd ..
chmod -R 700 keys
cd keys/
ll
_dock1
nano .bashrc
cd
nano .bashrc
cat .bash
exec /bin/bash --rcfile /tmp/.bashrc
exit
exit
_vps1
exit
_vps1
_time
clear
ll
df -h
ls -la
nano .bash
nano .bashrc
ll
bash
_dock2
mv .bash .tmp
bash
_dock2
mv .tmp .bash
lla
cat .bash
cat .bashrc
cat log/bash_deploy.log 
cat .bashrc
ll
lla
chmod 777 .bash*
lla
_dock2
_sshw
_logtech
nano .bashrc
bash
_vps2
lla
cat .bash
_dock3
cat keys/id_rsa 
_vps2
_vps2
_sshp
_prox1
_vps1
_vps2
_vps1
_vps2
_prox1
_prox1
_vps1
_vps2
_vps1
_vps1
_vps1
_vps2
_dock1
_time
_time
_dock3
_dock2
_dock1
_prox1
_sshp
_prox1
_vps1
_vps2
_vps1
_vps2
_dock1
_vps2
_vps1
_vps2
_vps1
_vps2
_vps2
_vps2
_vps2
_prox1
_pihole
_pihole
exit
_dock1
exit
_dock1
_pihole
lla
nano .bashrc
exit
exit
_elk1
cat /etc/yum/yum-cron.conf 
_elk1
_elk1
__pihole
_pihole
yum install syslog
_pihole
lla
cat .bash_history 
_elk1
nano .bashrc
_elk1
nano .bashrc
_elk1
nano .bashrc
_elk1
_elk1
_elk1
cat /etc/yum/yum-cron.conf 
_elk1
_pihole
_elk1
_elk1
_dock1
_dock1
cat /etc/yum/yum-cron.conf 
nano .bashrc
exit
exit
_elk1
nano .bashr
nano .bashrc
exit
exit
_elk2
_elk2
exit
exit
_elk3
exit
exit
_dock1
grep vm.max_map_count /etc/sysctl.conf
_prox1
_elk3
_elk2
_dock1
_elk2
_elk2
_elk2
_elk2
_elk2
_elk2
_elk2
_elk2
_elk2
_elk3
_elk3
_elk3
_elk3
_elk3
_elk3
_elk3
_elk3
_elk1
_elk1
_elk1
_elk1
_elk1
_elk1
_elk1
_elk1
_prox1
_dock3
_dock1
_dock2
_dock1
_dock2
_elk1
_dock1
_dock2
_dock3
_dock1
_dock1
_pihole
_prox1
_prox1
_prox1
ll
_dock1
exit
_dock1
_dock1
_vps1
_vps2
_dock1
_prox1
_dock1
_vps1
_vps2
_vps1
_vps1
nano .bashrc
bash
_prox1
_dock1
_prox1
_vps1
_vps1
_vps1
_vps1
_vps1
_dock1
_dock1
ping 192.168.255.6
_dock1
_dock1
ping 192.168.1.101
ping 192.168.1.101
_dock1
_dock1
_dock1
_prox1
_dock1
_dock1
_dock1
_pihole
_pihole
_pihole
cls
ll
nano .bashrc
exit
exit
_dock1
_pihole
_pivpn
cat /etc/yum/yum-cron.conf
_pivpn
nano .bashrc
exit
exit
_prox1
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_dock3
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_dock1
_vpn
ssh root@192.168.1.97
_vpn
_vpn
_vpn
ping 192.168.1.97
_prox1
telnet
yum install -y telnet
telnet
telnet 192.168.1.97 1194
ping 192.168.1.97
nc -vz -u 10.1.0.100 53
yum install -y nc
nc -vz -u 192.168.1.101 53
nc -vz -u 192.168.1.97 1194
nc -vz -u home.marvinmarvin.de 1194
_vps1
_vps1
_vps2
_vps
_vpn
_vps1
_vpn
_vps2
_prox1
_pihole
_vps
_vpn
_vpn
_vpn
_prox1
_vpn
_vpn
_vpn
_prox1
_vpn
_dock1
_dock1
_prox1
_dock1
_vps2
_vps2
_vps2
_dock1
_dock3
_dock1
_dock3
_dock3
_dock1
_dock1
_prox1
_dock1
_dock1
_pihole
_dock2
_dock3
_dock1
_prox1
_dock1
_dock3
ll
ll keys/
ssh -i keys/id_rsa 192.168.1.254
ssh -i keys/id_rsa 192.168.1.254
_vps2
_dock1
ll
_sshp
hostnamectl status
_vps1
_dock3
_dock1
_pihole
cat /etc/ssh/sshd_config
cat /etc/yum/yum-cron.conf 
history
ssh -i keys/id_rsa 192.168.1.254
nano /root/.ssh/known_hosts
ssh -i keys/id_rsa 192.168.1.254
nano .bashrc
exit
exit
_sshfs
_sshfs
ll
yum install -y sshfs
sshfs
sshfs -h
mkdir test
ll
sshfs -F keys/id_rsa 192.168.1.254:/usr2 /root/test
modprobe fuse
ll
cd keys/
ll
cat id_rsa 
_vps1
_sshfs
_dock3
_dock3
cat keys/id_rsa 
history
sshfs -o identityfile=/root/keys/id_rsa 192.168.1.254:/usr2 /root/test4
mkdir test4
sshfs -o identityfile=/root/keys/id_rsa 192.168.1.254:/usr2 /root/test4
ll
lla
cat .ssh/authorized_keys 
cat .ssh/known_hosts 
md5sum keys/id_rsa 
ll
rsync -avx keys/id_rsa 192.168.1.101:/root/.
rsync -avx keys/id_rsa 192.168.1.103:/root/.
modprobe fuse
sshfs -F keys/id_rsa 192.168.1.254:/usr2 /root/test
sshfs -F keys/id_rsa 192.168.1.254:/usr2 /root/test
sshfs -F keys/id_rsa 192.168.1.254:/usr2 /root/test
sshfs 192.168.1.254:/usr2 /root/test
ll
cd test/
ll
dd if=/dev/zero of=/root/test/testfile bs=1G count=1 oflag=direct ; rm -f /root/test/testfile
dd if=/dev/zero of=/root/test/testfile bs=10M count=1 oflag=direct ; rm -f /root/test/testfile
ll
cd
ll
cd test/
ll
cd ..
ll
cd test/
touch jo
ll
mount
dd if=/dev/zero of=/root/test/testfile bs=10M count=1 oflag=direct
dd if=/dev/zero of=/root/test/testfile bs=100M count=1 oflag=direct
dd if=/dev/zero of=/root/test/testfile bs=50M count=1 oflag=direct
fusermount -u /root/test
fusermount -u -f /root/test
fusermunt
fusermount
fusermount --help
ll
cd
ll
rmdir test
_dock1
_dock2
ll
mkdir test2
history
sshfs -F keys/id_rsa 192.168.1.254:/usr2 /root/test2
sshfs --help
sshfs -o IdentityFile=/root/keys/id_rsa 192.168.1.254:/usr2 /root/test2
ll
mkdir test3
nano /etc/fstab
mount -a
nano /etc/fstab
mount -a
ll
cd test3
ll
mkdir joooo
cd ../test2/
ll
cd ..
ll
cat /etc/fstab
mkdir /test
rmdir /test
ll
mkdir test3/volumes
_dock1
_prox1
ll
cd test3
ll
rmdir joooo/
ll
cd ..
ll
cat /etc/fstab
fuse
yum install fuse
ll
rm -rf test*
ll
yum remove sshfs --remove-leaves
yum remove sshfs
ll
ll
nano .bashrc
exit
exit
_prox1
ssh 192.168.1.254
nano /root/.ssh/known_hosts
ssh 192.168.1.254
ssh 192.168.1.254
cls
_sshp
_nfs
_dock2
_dock2
_dock2
_dock3
_dock3
_pihole
_dock1
_nfs
_dock1
_dock3
_dock2
_pihole
_time
_time
yum update
yum update
mkdir /var/lib/rpm/backup
cp -a /var/lib/rpm/__db* /var/lib/rpm/backup/
rm -f /var/lib/rpm/__db.[0-9][0-9]*
rpm --quiet -qa
rpm --rebuilddb
yum clean all
yum update
yum update
_nfs
shutdown now
_dock3
_nfs
_dock1
_dock2
_prox1
_nfs
_nfs
_nfs
_nfs
ping 192.168.1.254
ping 192.168.1.254
_nfs
_dock3
_dock3
_dock3
_dock3
_dock3
_dock3
_dock3
_dock3
_dock2
_dock2
_dock2
_dock2
_dock2
_dock2
_dock2
_dock1
_dock1
_dock1
_dock1
_dock1
_dock1
_dock3
_dock1
_nfs
_dock2
_nfs
_dock1
_prox1
__pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
_pihole
nslookup docker
_prox1
_pihole
_prox1
_pihole
nano .bashrc
exit
exit
ps -ef | grep fileb
yum install filebeat
ps -ef | grep ela
ll
yum update
yum remove aahfs
yum remove sshfs
_dock1
_dock2
_dock3
ll
ps -ef | grep sshf
kill 271
ps -ef | grep sshf
ll
cd test3/
ll
cd ..
ll
rmdir test3/
ll
_prox2
_dock2
_dock2
_dock2
_pihole
_pihole
_pihole
_nfs
_dock3
_dock3
_dock3
_dock1
_dock1
_pihole
_pihole
_dock1
_dock2
_nfs
_dock3
yum update
yum install -y deltarpm
yum update
reboot
_dock3
yum update
yum install -y deltarpm
yum update
reboot
_vps2
_vps1
_dock1
_dock1
_nfs
_dock2
_dock2
_pihole
_pihole
_pihole
_pihole
_pihole
uptime
_dock3
_dock3
_dock1
_pihole
_dock1
_dock2
_dock3
yum install qemu-guest-agent
_sshp
_pihole
_dock1
_dock2
_dock3
_prox1
nano .bashrc
exit
exit
nano .bashrc
exit
exit
_nfs
_time
_time
_time
_prox1
_nfs
_pihole
_pihole
_time
_nfs
_nfs
_dock1
_dock2
_dock3
_sshp
_nfs
_time
_pihole
_prox1
_nfs
_pihole
_vps1
_vps1
_vps1
_vps1
cat .bashrc
_vps2
_pihole
_vps1
ping cloudian.com
_vps2
_pihole
_nfs
nslookup cloudian.com
_nfs
_vps1
_nfs
nc -zv 5.230.24.151 22
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 443
nc -zv 5.230.24.151 443
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 80
nc -zv 5.230.24.151 443
nc -zv 5.230.24.151 80
_prox1
_vps1
_vps1
_vps2
_dock2
_dock3
_dock1
_pihole
_dock1
_vps1
_vps1
_nfs
nc -zv 5.230.24.151 80
_vps2
_vps1
_dock3
_dock3
_dock2
nano /etc/selinux/config
_dock1
_nfs
_dock1
_dock1
_dock1
_dock2
_dock2
_dock2
_dock3
_dock3
_dock3
_nfs
_nfs
_pihole
_dock1
_prox1
_prox1
_nfs
_prox1
_dock1
_vps2
_dock3
_vps2
_dock1
_vps2
_vps2
_dock2
_nfs
_dock3
_dock3
_dock2
_dock2
_dock1
_dock1
_dock1
yum install deltarpm -y
_dock1
_dock1
_dock1
_dock1
_vpn
_vpn
_vpn
_vpn
_vpn
_dock1
_sshp
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_prox1
_vps2
_nfs
_nfs
_dock3
_vps1
_dock1
_pihole
_dock1
_pihole 
_vps1
_pihole
_vps1
_nfs
dd if=/dev/urandom of=testfile bs=200M count=1
curl --progress-bar --verbose -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile --progress-bar  | tee /dev/null
curl --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile --progress-bar  | tee /dev/null
curl --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile | tee /dev/null
curl --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile
curl -Lo /dev/null -skw "\ntime_connect: %{time_connect}s\ntime_namelookup: %{time_namelookup}s\ntime_pretransfer: %{time_pretransfer}\ntime_starttransfer: %{time_starttransfer}s\ntime_redirect: %{time_redirect}s\ntime_total: %{time_total}s\n\n" --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile | tee /dev/null
curl -s -w "%{time_total}\n" -o /dev/null --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile | tee /dev/null
curl -s -o /dev/null -w '%{time_starttransfer}-%{time_pretransfer}' --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile | tee /dev/null
curl --progress-bar -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -v -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl --progress-bar -v -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -v -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -OLv -k -X PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -OLvkX PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -OLvkX PUT -T testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -OLvkX PUTT testfile https://s3-support.cloudian.com/incoming/testfile > /dev/null
curl -OLvkX PUT -T testfile https://s3-support.cloudian.com/incoming/testfile
curl -OLvkX PUTT testfile https://s3-support.cloudian.com/incoming/testfile | tee /dev/null
curl -OLvkX PUT -T testfile https://s3-support.cloudian.com/incoming/testfile | tee /dev/null
ll
rm testfile 
exit
_vps2
_vps1
_pihole 
_pihole 
_nfs
_vps2
_vps2
_vps2
_dock1
_prox1
_pihole
_dock1
_pihole
_pihole
_nfs
_vps1
_prox1
_pihole
_dock1
exit
_logtech
exit
_nfs
slurm
_nfs
_prox1
_pihole
_vps2
_pihole
_prox1
_pihole
_prox1
_pihole
_pihole
_vpn
nano .bashrc
_vpn
_dock1
_vpn
_prox1
_vpn
_vpn
exit
exit
_vpn
_pihole
_sshp
_time
_sshp
_vps2
_vps1
cat /etc/resolv.conf 
_vps2
_vps2
_vps2
_vpn
_vpn
_vpn
_vps2
_vps2
_vps2
_vps2
_vps2
_pihole
_pihole
_sshp
_vps1
_time
_pihole
_dock1
_vpn
_dock1
_dock1
_pihole
_sshp
_dock1
_prox1
_vps1
_pihole
_nfs
telnet vpn 80
telnet vpn 34777
nc -vz -u 10.1.0.100 53
nc -vz -u vpn 34777
nc -vz -u vpn 34778
_vps2
_vps2
_vps2
_vps1
_nfs
_vpn
_vps2
_vpn
_nfs
_pihole
_vpn
_vps2
_vps
_vps2
_vps2
_vpn
_vpn
_vpn
ping 10.0.0.40
ping 10.0.0.50
_vps2
_nfs
_dock1
_vps1
_pihole
_vps2
_vpn
_time
_prox1
_time
_time
_prox1
_time
_nfs
_vps2
exit
exit
_dock1
_pihole
_vps2
_vpn
_prox1
_vpn
_sshp
_nfs
_nfs
_prox1
_nfs
_dock1
_dock1
_vps2
_prox1
_prox1
_vps1
_sshp
_vpn
_time
_vpn
_vpn
_nfs
_pihole
_dock2
_dock3
_dock1
yum update -y
_vpn
_pihole
_dock3
_vpn
_dock1
_vpn
_pihole
_nfs
_pihole
_dock1
_dock2
_dock1
_vps2
_nfs
_pihole
nano .bashrc
_vpn
_nfs
_dock1
_dock2
_dock3
_dock1
_prox1
_vps1
lla
ll
lla
du -sh .bash*
du -sh .bashlla
lla
ll
cd log/
ll
cd ..
ll
_sshp
_vps2
nano .bashrc
_vps2
_vps2
_dock1
_nfs
_vps2
_vps2
_vps1
yum install stress-ng -y
stress-ng --cpu 4 --timeout 60s --metrics-brief
_dock1
_prox1
exit
_prox1
_nfs
_dock1
ntpdate
cat /etc/ntp.conf 
ntpdate 192.168.1.1
_sshp
_vpn
_dock1
_dock1
cat /etc/ntp.conf 
nano /etc/ntp.conf 
yum install -y ntp ntpdate
timedatectl set-timezone Europe/Berlin
nano /etc/ntp.conf
echo "server fritz.box prefer" >> /etc/ntp.conf
cat /etc/ntp.conf 
systemctl enable ntpd
systemctl start ntpd
systemctl status ntpd
ntpdate –u fritz.box
ntpstat
ntpq -p
ntpdate -u fritz.box && hwclock -w
ntpstat
_sshp
_vpn
_sshp
cp /etc/ntp.conf /etc/ntp.conf.bak
sed -i '/server/d' /etc/ntp.conf
echo "server fritz.box prefer" >> /etc/ntp.conf
echo "server 192.168.1.1 iburst" >> /etc/ntp.conf
systemctl restart ntpd
systemctl status ntpd
ntpdate -u fritz.box && hwclock -w
ntpstat
ntpq -p
_sshp
_nfs
_pihole
_dock2
_dock3
_vpn
_time
_sshp
_vps1
_sshp
_prox1
systemctl status  yum-cron
cat /etc/yum/yum-cron.conf
_dock2
_prox1
_sshp
systemctl enable fstrim.timer ; systemctl start fstrim.timer ; systemctl status fstrim.timer ; fstrim -av
yum update
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_vpn
_dock3
_dock3
_prox1
systemctl enable fstrim.timer ; systemctl start fstrim.timer ; systemctl status fstrim.timer 
fstrim -av
_sshp
_pihole
_sshp
_time
_prox1
systemctl enable fstrim.timer ; systemctl start fstrim.timer ; systemctl status fstrim.timer 
fstrim -av
_sshp
_pihole
_sshp
_time
_nfs
_nfs
_dock1
_dock1
cat /etc/yum/yum-cron.conf 
_pihole
_time
_time
_dock1
_dock1
_dock1
_dock2
_dock2
_dock2
_dock3
_dock3
_dock3
_prox1
_nfs
_nfs
_nfs
_nfs
_vps1
_prox1
_pihole
_vps1
_pihole
_vps1
_vpn
cat /etc/yum/yum-cron.conf
cat .bashrc
_vpn
ping 107.173.29.226
ssh root@107.173.29.226
ssh root@23.95.61.166
ping 23.95.61.166
ssh root@23.95.61.166
ll
lla
ll
lla
cd test3/
ll
cd ..
rmdir test3/
ll
cd log/
ll
cd ..
lla
exit
exit
cat /etc/yum/yum-cron.conf
