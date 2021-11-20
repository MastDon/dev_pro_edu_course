FROM ubuntu:20.04

# Update Ubuntu Software repository

RUN  apt-get update -y  && \
    apt install -y php-fpm php-mysqli php-mbstring php-xml zip wget && \
    wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.zip && \
    unzip -q phpMyAdmin*.zip && \
    mv phpMyAdmin-5.0.0-all-languages /usr/share/phpmyadmin && \
    apt install nginx -y


EXPOSE 80

ADD ./config/default /etc/nginx/sites-available/default
ADD ./config/index.php /var/www/html/index.php
ADD ./config/config.inc.php /usr/share/phpmyadmin/config.inc.php


CMD /etc/init.d/php7.4-fpm restart && nginx -g "daemon off;"