# requirement
##############################################
# 1. private key at .ssh/ (sudo chmod 600 ~/.ssh/id_rsa)
# 2. git command
##############################################

# setup zsh + vim setting
##############################################

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
sudo chsh -s /bin/zsh

# what's left
# open vim and run :BundleInstall

# install basic software for mac
##############################################

# install homebrew + cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew install tig

# install minimum software
brew install vim
brew cask install google-chrome
brew cask install alfred
brew cask install xtrafinder
brew cask install bettertouchtool
brew cask install iterm2
brew cask install dropbox
brew cask install libreoffice
brew cask install atom

# optional
brew cask install virtualbox
brew cask install vagrant

