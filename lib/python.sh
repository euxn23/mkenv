git -C ~/.pyenv pull || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PATH=~/.pyenv/bin:$PATH
pyenv install miniconda3-latest
conda create -n python2 python=$(cat lib/versions/python2)
conda create -n python3 python=$(cat lib/versions/python3)
pyenv global miniconda3-latest/envs/python3 miniconda3-latest/envs/python2

