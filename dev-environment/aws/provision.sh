#!/bin/bash

echo hello world


sudo apt-get install -y git python-pip
sudo pip install virtualenv



curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

source ~/.profile


nvm install 0.10.35

## make node available from sudo
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

sudo npm install -g grunt-cli bower && sudo npm cache clean


## install dsl-parser-cli
git clone  https://github.com/cloudify-cosmo/cloudify-dsl-parser-cli.git
virtualenv dsl-parser
source dsl-parser/bin/activate

cd cloudify-dsl-parser-cli
pip install -r dev-requirements.txt