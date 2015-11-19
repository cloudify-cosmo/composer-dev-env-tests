#!/bin/bash



echo hello world

sudo apt-get update -y
sudo apt-get install -y git python-pip
sudo pip install virtualenv



curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

. .nvm/nvm.sh
source .nvm/nvm.sh

echo "installing node 0.10.35"
nvm install 0.10.35
npm --version

## make node available from sudo
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

sudo npm install -g grunt-cli bower && sudo npm cache clean


## install dsl-parser-cli
git clone  https://github.com/cloudify-cosmo/cloudify-dsl-parser-cli.git
virtualenv dsl-parser
. dsl-parser/bin/activate

cd cloudify-dsl-parser-cli
pip install -r dev-requirements.txt .


sudo apt-get install unzip -y

## now start the projec
cd ~
COMPOSER_BASE_URL=cloudify-blueprint-composer-master
cp /vagrant/dev/${COMPOSER_BASE_URL}.zip .
unzip cloudify-blueprint-composer-master.zip

TOPOLOGY_BASE_URL=cloudify-blueprint-topology-master
cp /vagrant/dev/${TOPOLOGY_BASE_URL}.zip .
unzip cloudify-blueprint-topology-master.zip


## lets setup composer
pushd $COMPOSER_BASE_URL
npm install && bower install
nohup grunt server > grunt.log 2>&1 &

export ME_CONF_JSON="/vagrant/dev/me.json"
echo "export ME_CONF_JSON=\"/vagrant/dev/me.json\"" >> ~/.bashrc

nohup node server > server.log 2>&1 &
popd

## todo: add topology support
