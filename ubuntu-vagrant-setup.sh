# ready private key before proceed
# --------------------------------
# mkdir .ssh/
# copy id_rsa/id_rsa.public/config to .ssh/ folder
# sudo chmod 600 ~/.ssh/id_rsa

# first install required item
sudo apt-get -y install build-essential git-core tig wget curl htop tmux \
    rake exuberant-ctags vim-gtk silversearcher-ag zsh

# ready directory
mkdir ~/project

git clone https://github.com/fredw08/dotfiles.git       ~/project/dotfiles
git clone https://github.com/square/maximum-awesome.git ~/project/maximum-awesome
git clone git://github.com/gmarik/vundle.git            ~/project/maximum-awesome/vim/bundle/vundle

# install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# link file
ln -s ~/project/dotfiles/.zshrc               ~/.zshrc
ln -s ~/project/dotfiles/fred.zsh-theme       ~/.oh-my-zsh/custom/fred.zsh-theme
ln -s ~/project/maximum-awesome/vim           ~/.vim
ln -s ~/project/maximum-awesome/vimrc         ~/.vimrc
ln -s ~/project/maximum-awesome/vimrc.bundles ~/.vimrc.bundles
ln -s ~/project/dotfiles/.vimrc.local         ~/.vimrc.local
ln -s ~/project/dotfiles/.vimrc.bundles.local ~/.vimrc.bundles.local
ln -s ~/project/dotfiles/.gitconfig           ~/.gitconfig
ln -s ~/project/dotfiles/.tmux.conf           ~/.tmux.conf

# make zsh as default
chsh -s /bin/zsh vagrant

# install required dev soft for ubuntu 14.04
# update package list
sed -i 's/archive\.ubuntu\.com/ftp\.cuhk\.edu\.hk\/pub\/Linux/g' /etc/apt/sources.list
sed -i 's/security\.ubuntu\.com/ftp\.cuhk\.edu\.hk\/pub\/Linux/g' /etc/apt/sources.list
sudo apt-get update

sudo apt-get -y install python-software-properties

# setup proper locale
locale-gen en_HK.utf8
update-locale LC_ALL=en_HK.utf8 LANG=en_HK.utf8
export LANG=en_HK.UTF8

# install required packages
sudo apt-get -y install build-essential git-core tig wget curl htop tmux \
    rake exuberant-ctags vim-gtk silversearcher-ag zsh
sudo apt-get -y install nginx postgresql-9.3 postgresql-contrib-9.3 redis-server
sudo apt-get -y install bison openssl libssl-dev libxslt1.1 libxslt1-dev \
    libxml2 libxml2-dev libffi-dev libyaml-dev autoconf \
    libc6-dev libreadline6-dev zlib1g zlib1g-dev \
    ruby-dev libruby2.0 libsqlite3-dev libpq-dev

# chruby
git clone git://github.com/postmodern/chruby.git ~/src/chruby
cd ~/src/chruby
sudo make install

# ruby-install
git clone git://github.com/postmodern/ruby-install.git ~/src/ruby-install
cd ~/src/ruby-install
sudo make install

# phantomjs
cd /tmp
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
tar xvjf phantomjs-1.9.7-linux-x86_64.tar.bz2
mv phantomjs-1.9.7-linux-x86_64 /usr/local/share/phantomjs
sudo ln -s /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs

# nodejs
cd /tmp
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
sudo cd /usr/local && tar --strip-components 1 -xzf /tmp/node-v0.10.28-linux-x64.tar.gz

# set timezone
sudo echo 'Asia/Hong_Kong' | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

# install ruby
ruby-install ruby 2.1.5

# what's left (configuration)
# vim
# > open vim and run :BundleInstall
#
# postgres
# > sudo su postgres
# > createuser -s vagrant
# edit /etc/postgresql/9.3/main/pg_hba.conf > all trust



