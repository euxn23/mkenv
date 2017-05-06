bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.4 --binary
gvm use go1.4
gvm install `cat lib/versions/golang`
gvm use `cat lib/versions/golang` --default

