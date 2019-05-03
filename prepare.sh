# backup existing files
mkdir ~/.bash_old
mv ~/.bash* .bash_old
mv ~/.ssh .bash_old

# prepare bash
ln -s ~/bash-acc/.bash
ln -s ~/bash-acc/.bashrc
ln -s ~/bash-acc/.bash_profile
ln -s ~/bash-acc/.ssh
ln -s ~/bash-acc/keys