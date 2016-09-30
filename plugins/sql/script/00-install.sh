#!/bin/sh

# root privileges check
if [ `id -u` -ne '0' ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

baseDirectory=$(dirname $0)

# MySQL
echo "Installing mysql server..."
echo 'mysql-server- mysql-server/root_password password lamp' | debconf-set-selections
echo 'mysql-server- mysql-server/root_password_again password lamp' | debconf-set-selections
apt-get install -y mysql-server
echo "Mysql server installed."

sleep 0.5

echo "ServerName localhost" >> /etc/apache2/apache2.conf
