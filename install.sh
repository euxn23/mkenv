
if [ "$(uname)" == 'Darwin' ]; then

if !(type brew) &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade
brew install autoconf automake bison gcc git icu4c jpeg libiconv libmcrypt libpng libxml mysql openssl re2c redis wget
brew link --force bison icu4c libxml2 openssl
brew tap caskroom/cask
brew cask install virtualbox vagrant docker

elif (type apt)&>/dev/null; then

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt upgrade -y
sudo apt install -y bison build-essential curl git redis-tools mysql-client

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo gpasswd -a $USER docker

else
  echo 'Your Operation System is not supported'
  exit 0
fi

PREREQUIREMENTS=(
  curl
  git
)
missing=false

for r in "${PREREQUIREMENTS[@]}"
do
  if !(type ${r})&>/dev/null; then
    echo "${r} is not installed"
    missing=true
  fi
done

if $missing; then
  exit 0
fi

if [ "$(uname)" == 'Darwin' ]; then
  brew update
  brew install elixir
elif type apt &>/dev/null; then
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
  sudo apt-get update
  sudo apt-get install -y esl-erlang
  sudo apt-get install -y elixir
fi

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.4 --binary
gvm use go1.4
gvm install $(cat lib/versions/go)
gvm use $(cat lib/versions/go) --default

curl -sSL https://get.haskellstack.org/ | sh

git clone https://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh
nvm install $(cat lib/versions/node)
nvm alias default $(cat lib/versions/node)

git -C ~/.phpenv pull || git clone git://github.com/laprasdrum/phpenv.git ~/.phpenv
git -C ~/.phpenv/plugins/php-build pull || git clone git://github.com/php-build/php-build.git ~/.phpenv/plugins/php-build
export PATH=~/.phpenv/bin:$PATH
phpenv install $(cat lib/versions/php)
phpenv global $(cat lib/versions/php)

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PATH=~/.pyenv/bin:$PATH
pyenv install miniconda3-latest
conda create -n python2 python=$(cat lib/versions/python2)
conda create -n python3 python=$(cat lib/versions/python3)
pyenv global miniconda3-latest/envs/python3 miniconda3-latest/envs/python2

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH=~/.rbenv/bin:$PATH
rbenv install $(cat lib/versions/ruby)
rbenv global $(cat lib/versions/ruby)

if [ "$(uname)" == 'Darwin' ]; then
  brew update
  brew install sbt
elif type apt &>/dev/null; then
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
  sudo apt update
  sudo apt install -y sbt
fi

