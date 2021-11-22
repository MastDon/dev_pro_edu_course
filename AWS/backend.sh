#!/bin/bash
echo "------------START INSTALL S3fs------------"
yum update -y
amazon-linux-extras install -y epel
yum install  s3fs-fuse -y
mkdir /home/ec2-user/s3storage
s3fs -o iam_role=auto -o endpoint=eu-central-1 -o url="https://s3-eu-central-1.amazonaws.com" dp-s3-education /home/ec2-user/s3storage
echo "------------FINISH INSTALL S3fs------------"

echo "------------START INSTALL NGINX------------"
amazon-linux-extras install  nginx1 -y
cp /home/ec2-user/s3storage/Nginx_conf/Backend/nginx.conf /etc/nginx/
systemctl start nginx
systemctl enable nginx
echo "------------FINISH INSTALL NGINX------------"

echo "------------START DB & php------------"
amazon-linux-extras install  lamp-mariadb10.2-php7.2 php7.2 -y
yum install   mariadb-server -y
systemctl start mariadb
systemctl enable mariadb
echo "------------FINISH INSTALL DB & PHP------------"

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
echo "<?php
 phpinfo();
 ?>" >>/usr/share/nginx/html/index.php
systemctl restart nginx
