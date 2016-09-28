#!/bin/sh

baseDirectory=$(dirname $0)

# PHP5
apt-get install -y php5.6 php5.6-curl php5.6-intl php5.6-mcrypt php5.6-memcache php5.6-memcached php5.6-mongo php5.6-mysqlnd php5.6-gd php5.6-xdebug php-apc phpunit phpunit-selenium
php5enmod mongo php5-dev

timezone=`find /usr/share/zoneinfo -type f | xargs md5sum | grep $(md5sum /etc/localtime | awk '{print $1};') | awk '{print $2};' | cut -c 21-`

# PHP5 - Settings
echo "Setting up php5.6.."
sed "s/^date.timezone.*$/date.timezone = $timezone/" $baseDirectory/../config/apache2.ini > /etc/php5/apache2/php.ini
rm /etc/php5/cli/php.ini
ln -s /etc/php5/apache2/php.ini /etc/php5/cli/php.ini

# PHP5 - Composer package system installation
echo "Installing composer"
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer.phar
ln -s /usr/bin/composer.phar /usr/bin/composer
