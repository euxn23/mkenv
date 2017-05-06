if [ "$(uname)" == 'Darwin' ]; then
  brew update
  brew install elixir
elif type apt &>/dev/null; then
  wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
  sudo apt-get update
  sudo apt-get install -y esl-erlang
  sudo apt-get install -y elixir
fi

