#!/bin/bash

export PORT=80
export ME_CONF_JSON=/vagrant/dev/me.json
nohup node server  > server.log 2>&1 &
#node server