#!/bin/bash
echo "------------ADD PERMISSIONS------------"
groupadd www
usermod -a -G www ec2-user
chown -R ec2-user:www /usr/share/nginx/html
chmod 2775 /usr/share/nginx/html && find /usr/share/nginx/html -type d -exec  chmod 2775 {} \;
find /usr/share/nginx/html -type f -exec sudo chmod 0664 {} \;

echo "------------INSTALL PHPMYADMIN------------"
yum install php-mbstring php-xml -y
systemctl restart nginx.service
systemctl restart php-fpm
cd /usr/share/nginx/html/
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
mkdir phpmyadmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpmyadmin --strip-components 1
rm phpMyAdmin-latest-all-languages.tar.gz