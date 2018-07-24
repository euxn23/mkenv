git -C ~/.pyenv pull || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PATH=~/.pyenv/bin:$PATH
python2=$(cat lib/versions/python2)
python3=$(cat lib/versions/python3)
pyenv install $python3
pyenv install $python3
pyenv global $python3 $python2

