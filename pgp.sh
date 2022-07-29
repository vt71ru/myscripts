#!/usr/bin/env  bash

apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys EAC0D406E5D79A82ADEEDFDFB76E53652D87398A
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb && dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 2CC26F777B8B44A1
wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && rm winehq.key
