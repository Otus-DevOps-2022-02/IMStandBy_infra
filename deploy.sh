#!/bin/bash
apt-get install git
apt-get update
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
