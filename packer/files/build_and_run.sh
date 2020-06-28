#!/bin/bash
apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
touch /etc/systemd/system/puma.service
chmod 664 /etc/systemd/system/puma.service
systemctl daemon-reload
systemctl start puma
systemctl enable puma
