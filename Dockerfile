FROM debian:buster
MAINTAINER Melchior MAJ <mmaj@42.student.fr>

# run command : docker build -t servertest . ; docker run -it -p 80:80 -p 443:443 server

#installer php et nginx
RUN apt-get update && apt-get upgrade && apt-get install -y nginx vim mariadb-server mariadb-client wget
RUN apt-get install -y php php-fpm php-gd php-mysql php-cli php-curl php-json

#installer Wordpress
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -zxvf latest-fr_FR.tar.gz
RUN mv wordpress /var/www/html/wordpress
#donner les droits
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
#suppression fichiers inutiles
RUN rm latest-fr_FR.tar.gz
RUN rm var/www/html/index.nginx-debian.html && rm var/www/html/wordpress/wp-config-sample.php

#installer PhpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin
RUN rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

#remplacer fichiers de config
ADD ./srcs/php.ini /etc/php/7.3/fpm/php.ini
ADD ./srcs/default /etc/nginx/sites-available/default
ADD ./srcs/wordpress /etc/nginx/sites-available/wordpress
ADD ./srcs/wp-config.php ./var/www/html/wordpress/wp-config.php

#installer clés SSL
ADD ./srcs/localhost.cert /etc/ssl/certs/localhost.cert
ADD ./srcs/localhost.key /etc/ssl/private/localhost.key

#initialiser serveur et creer base de donnees
ADD ./srcs/create_database.sql create_database.sql
ADD ./srcs/set_data.sh set_data.sh
ADD ./srcs/init_server.sh init_server.sh
RUN sh set_data.sh

#garder le serveur ouvert
ADD ./srcs/run_serv.sh run_serv.sh
CMD ["bash", "./run_serv.sh"]
# CMD ["bash"]