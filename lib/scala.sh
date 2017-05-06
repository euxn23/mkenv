if [ "$(uname)" == 'Darwin' ]; then
  brew update
  brew install sbt
elif type apt &>/dev/null; then
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
  sudo apt update
  sudo apt install -y sbt
fi

