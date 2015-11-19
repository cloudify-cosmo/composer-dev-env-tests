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


## install dsl-parser-cli
git clone  https://github.com/cloudify-cosmo/cloudify-dsl-parser-cli.git
virtualenv dsl-parser
. dsl-parser/bin/activate


cd cloudify-dsl-parser-cli
pip install -r dev-requirements.txt .


sudo apt-get install unzip -y

## now start the projec
cd ~
COMPOSER_ARTIFACT=blueprintcomposer-3.3.0.tgz
cp /vagrant/dev/${COMPOSER_ARTIFACT} .
tar -xzvf ${COMPOSER_ARTIFACT}
cd package

export ME_CONF_JSON="/vagrant/dev/me.json"
echo "export ME_CONF_JSON=\"/vagrant/dev/me.json\"" >> ~/.bashrc

chmod 775  ./backend/PluginsAndOperations/plugin_parser/scripts/*.sh
sudo /vagrant/start.sh




