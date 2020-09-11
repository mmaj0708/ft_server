#Install & Update
# apt-get update && apt-get upgrade && apt-get install -y mariadb-server mariadb-client
# apt-get install -y nginx vim wget

#php
apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-gd php7.3-cli 
apt-get install -y php7.3-common php7.3-json php7.3-opcache php7.3-readline
apt-get install -y php7.3-mbstring php7.3-gd php7.3-curl
apt-get install -y php-fpm php-mysql
#rm /etc/php/7.3/fpm/php.ini

#Wordpress
# wget https://fr.wordpress.org/latest-fr_FR.tar.gz
# tar -zxvf latest-fr_FR.tar.gz
# mv wordpress /var/www/html/wordpress
# rm latest-fr_FR.tar.gz

#PHPmyAdmin
# wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
# tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
# mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin
# rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

#NGINX ALLOW
# chown www-data:www-data /var/www/html/* -R
# chmod 755 /var/www/html/* -R
# rm var/www/html/index.nginx-debian.html
