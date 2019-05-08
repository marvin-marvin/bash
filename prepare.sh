# backup existing files
mkdir -p ~/.bash_old
mv ~/.bash ~/.bash_old
mv ~/.bashrc ~/.bash_old
mv ~/.bash_profile ~/.bash_old
mv ~/.ssh ~/.bash_old
mkdir -p ~/bash-keys

# prepare bash
ln -s ~/bash-acc/.bash ~/.bash
ln -s ~/bash-acc/.bashrc ~/.bashrc
ln -s ~/bash-acc/.bash_profile ~/.bash_profile
ln -s ~/bash-acc/.ssh ~/.ssh

# install crontab
/bin/wget -q https://gist.githubusercontent.com/marvin-marvin/ba839de656c98fa3eb7ac5685f99327c/raw/crontab.txt -O /tmp/crontab ; /usr/bin/crontab /tmp/crontab