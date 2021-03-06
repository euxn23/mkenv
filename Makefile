.PHONY: all

all: distro prerequirements go node python ruby

prerequirements:
	bash lib/prerequirements.sh

distro:
	bash lib/distro.sh
apt:
	bash lib/apt.sh
brew:
	bash lib/brew.sh

elixir:
	bash lib/elixir.sh
go:
	bash lib/go.sh
haskell:
	bash lib/haskell.sh
node:
	bash lib/node.sh
php:
	bash lib/php.sh
python:
	bash lib/python.sh
ruby:
	bash lib/ruby.sh
scala:
	bash lib/scala.sh

build:
	bash dev/build.sh

