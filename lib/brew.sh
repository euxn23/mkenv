if !(type brew) &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade
brew install autoconf automake bison gcc git icu4c jpeg libiconv libmcrypt libpng libxml2 mysql openssl re2c redis wget
brew link --force bison icu4c libxml2 openssl
brew tap caskroom/cask
brew cask install virtualbox vagrant docker

