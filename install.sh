
if [ "Darwin" == 'Darwin' ]; then

if !(type brew) &>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade
brew install git mysql redis wget
brew tap caskroom/cask
brew cask install virtualbox vagrant docker

elif (type apt)&>/dev/null; then

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential curl git redis-tools mysql-client

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
  sudo apt-get install esl-erlang
  sudo apt-get install elixir
fi

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.4 --binary
gvm use go1.4
gvm install `cat versions/golang`
gvm use `cat versions/golang` --default

curl -sSL https://get.haskellstack.org/ | sh

git clone https://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh
nvm install `cat versions/node`
nvm alias default `cat vertsions/node`

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install miniconda3-latest
conda create -n python2 python=`cat versions/python2`
conda create -n python3 python=`cat versions/python3`
pyenv global miniconda3-latest/envs/python3 miniconda3-latest/envs/python2

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install `cat versions/ruby`

if [ "$(uname)" == 'Darwin' ]; then
  brew update
  brew install sbt
elif type apt &>/dev/null; then
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
  sudo apt update
  sudo apt install -y sbt
fi

