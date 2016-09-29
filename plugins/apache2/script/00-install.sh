#!/bin/sh

apt-get install -y apache2 libapache2-mod-xsendfile apache2-mpm-itk libapache2-mod-php5 phpmyadmin
a2enmod vhost_alias
a2enmod rewrite
a2enmod xsendfile
a2enmod libapache2-mod-xsendfile
a2dismod mpm_itk
a2dismod mpm_prefork

#echo "ServerName localhost" >> /etc/apache2/apache2.conf

chown -R lamp.lamp /var/www
