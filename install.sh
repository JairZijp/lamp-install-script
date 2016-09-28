#!/bin/sh

if [ `id -u` -ne '0' ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Lamp user creation
if ! id "lamp" > /dev/null 2>&1; then
    echo "Lamp user does not exist - Creating lamp user..."
    (echo "lamp"; echo "lamp"; echo ""; echo ""; echo ""; echo ""; echo ""; echo ""; echo "Y") | adduser -q lamp
    adduser lamp sudo
fi

echo "lamp" > /etc/hostname
hostname lamp

baseDirectory=$(dirname $0)
pluginsDirectory=$baseDirectory/plugins

apt-get update --fix-missing

# System wide
echo "Installing system wide applications..."
command -v javac || apt-get install -y openjdk-7-jdk
apt-get install -y ant curl git openssh-server unzip

# Apache 2
$pluginsDirectory/apache2/script/00-install.sh
$pluginsDirectory/apache2/script/20-vhosts.sh
$pluginsDirectory/apache2/script/30-jenkins_virtual_host.sh

# PHP 5
$pluginsDirectory/php5/script/php.sh

# SQL
$pluginsDirectory/sql/script/00-install.sh


# Setting bashrc
echo "Setting bashrc..."
cp $baseDirectory/bash.bashrc ~lamp/.bashrc
cp $baseDirectory/bash.bashrc /etc/bash.bashrc
