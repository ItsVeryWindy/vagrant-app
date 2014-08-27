#!/usr/bin/env bash
#########################
##  Personal Settings  ##
#########################

# Timezone for the system
TimeZone="Europe/Berlin"



########################################################################################################################
##                                      Vagrant Bootstrap BASH Shell Script                                           ##
########################################################################################################################


######################
##  Install System  ##
######################

# Set new timezone
rm /etc/timezone
echo $TimeZone > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

# Update Packet Management System
sudo apt-get update

# Install software into the system
sudo apt-get install -y \
    git git-core \
    nodejs nodejs-legacy npm \
    openssl curl \
	mongodb-org

git config --global url."https://".insteadOf git://
	
sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g meanio
	
cd /vagrant
	
sudo npm install --unsafe-perm --no-bin-link

# Set Shell Aliases
echo 'alias rm="rm -fv"' > /home/vagrant/.bash_aliases
echo 'alias ex="ls -lahv --color=auto"' >> /home/vagrant/.bash_aliases
echo 'alias ls="ls -aF --color=auto"' >> /home/vagrant/.bash_aliases
echo 'alias df="df -B h"' >> /home/vagrant/.bash_aliases
echo 'alias cp="cp -v"' >> /home/vagrant/.bash_aliases
echo 'alias mv="mv -v"' >> /home/vagrant/.bash_aliases
echo 'alias n="nano -w"' >> /home/vagrant/.bash_aliases
echo 'alias du="du -h --max-depth 1"' >> /home/vagrant/.bash_aliases
echo 'alias s="tail -f -n 250 /var/log/syslog"' >> /home/vagrant/.bash_aliases
echo 'alias cdwww="cd /var/www"' >> /home/vagrant/.bash_aliases
echo $'cd /vagrant\nexport DISPLAY=:10' >> /home/vagrant/.bash_profile