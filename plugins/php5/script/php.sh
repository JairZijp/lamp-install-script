#!/bin/sh

baseDirectory=$(dirname $0)

# PHP5
apt-get install -y php5 php5-curl php5-intl php5-mcrypt php5-mysqln libapache2-mod-php5

timezone=`find /usr/share/zoneinfo -type f | xargs md5sum | grep $(md5sum /etc/localtime | awk '{print $1};') | awk '{print $2};' | cut -c 21-`

# PHP5 - Settings
echo "Setting up php5"
sed "s/^date.timezone.*$/date.timezone = $timezone/" $baseDirectory/../config/apache2.ini > /etc/php5/apache2/php.ini
rm /etc/php5/cli/php.ini
ln -s /etc/php5/apache2/php.ini /etc/php5/cli/php.ini

# PHP5 - Composer package system installation
echo "Installing composer"
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer.phar
ln -s /usr/bin/composer.phar /usr/bin/composer
