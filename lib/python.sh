git -C ~/.pyenv pull || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PATH=~/.pyenv/bin:$PATH
pyenv install $(cat lib/versions/python3)
pyenv global $(cat lib/versions/python3)

