git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH=~/.rbenv/bin:$PATH
rbenv install $(cat lib/versions/ruby)
rbenv global $(cat lib/versions/ruby)

