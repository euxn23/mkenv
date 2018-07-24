GVM_NO_UPDATE_PROFILE=true bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
go=$(cat lib/versions/go)
gvm install $go --binary
gvm use $go --default

