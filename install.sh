# Mac OS X auto configuration
# Dmitry Voitenko, de.void
# MIT License
#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
formulas=(mc
          vim
          tree
          elixir)

brew install ${formulas[@]}

brew install caskroom/cask/brew-cask
casks=(transmission
       postgres
       vlc)
brew cask install ${casks[@]}

cd ~
git clone git://github.com/de-void/dotfiles
dotfiles/install.sh



# backup old dotfiles
echo -e "\033[1;31m"
mkdir ~/dotfiles_old
mv ~/.vim         ~/dotfiles_old/
mv ~/.vimrc       ~/dotfiles_old/
mv ~/.zshrc       ~/dotfiles_old/
[ "$(ls -A ~/dotfiles_old)" ] && echo -e "\033[0;32mbackup to ~/dotfiles_old\033[0m" || rm -r ~/dotfiles_old

# install good dotfiles
echo -e "\033[0;31m"
mkdir ~/.vim
echo -e "\033[0;32m"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/
echo -e "\033[0;31m"
ln -s ~/dotfiles/vim/ ~/.vim/bundle
ln -s ~/dotfiles/vimrc      ~/.vimrc
vim +PluginInstall +q +q
ln -s ~/dotfiles/zshrc      ~/.zshrc
echo -e "\033[0;32mgood dotfiles well installed!\033[0m"
