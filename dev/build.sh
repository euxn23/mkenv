cat <<EOF > install.sh

if [ "$(uname)" == 'Darwin' ]; then

$(cat lib/brew.sh)

elif (type apt)&>/dev/null; then

$(cat lib/apt.sh)

else
  echo 'Your Operation System is not supported'
  exit 0
fi

$(cat lib/prerequirements.sh)

$(cat lib/elixir.sh)

$(cat lib/golang.sh)

$(cat lib/haskell.sh)

$(cat lib/node.sh)

$(cat lib/python.sh)

$(cat lib/ruby.sh)

$(cat lib/scala.sh)

