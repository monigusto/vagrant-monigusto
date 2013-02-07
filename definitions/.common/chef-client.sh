#!/bin/bash -eux

wget -O - http://opscode.com/chef/install.sh | sudo bash -s -- -v 10.18.2
#gem install chef --version 0.16.4 --no-ri --no-rdocs
