if !(type brew) &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade
brew install git mysql redis wget
brew tap caskroom/cask
brew cask install virtualbox vagrant docker

