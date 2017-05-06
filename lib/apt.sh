sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt upgrade -y
sudo apt install -y bison build-essential curl git redis-tools mysql-client

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo gpasswd -a $USER docker

