#!/bin/bash
apt-get update
rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock
rm /var/lib/dpkg/lock-frontend
dpkg --configure -a
