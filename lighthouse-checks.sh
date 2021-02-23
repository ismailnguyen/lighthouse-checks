# lighthouse-checks

# #!/bin/bash

# set up key needed for google-chrome-stable
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# set up repository for google-chrome-stable
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# install script dependencies
apt-get update
apt-get install google-chrome-stable -y
npm i -g @lhci/cli

# validate installation
lhci healthcheck

# collect metrics and assert on them
lhci collect --url $1
lhci assert