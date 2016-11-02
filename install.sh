# Mac OS X auto configuration
# Dmitry Voitenko, de.void
# MIT License


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
dotfiles/install
