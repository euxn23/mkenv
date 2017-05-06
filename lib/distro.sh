if [ "$(uname)" == 'Darwin' ]; then
  bash lib/brew.sh
elif (type apt)&>/dev/null; then
  bash lib/apt.sh
else
  echo 'Your Operation System is not supported'
  exit 0
fi

