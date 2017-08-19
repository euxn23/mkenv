git -C ~/.phpenv pull || git clone git://github.com/laprasdrum/phpenv.git ~/.phpenv
git -C ~/.phpenv/plugins/php-build pull || git clone git://github.com/php-build/php-build.git ~/.phpenv/plugins/php-build
export PATH=~/.phpenv/bin:$PATH
phpenv install $(cat lib/versions/php)
phpenv global $(cat lib/versions/php)
