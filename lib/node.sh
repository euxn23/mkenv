git clone https://github.com/creationix/nvm.git ~/.nvm
source ~/.nvm/nvm.sh
nvm install $(cat lib/versions/node)
nvm alias default $(cat lib/versions/node)

