#!/bin/bash
echo "-------------------Install Nginx--------------------------"
amazon-linux-extras install nginx1 -y
systemctl start nginx.service
systemctl enable nginx.service
echo "-------------------Install PHP--------------------------"
amazon-linux-extras install php7.2 -y
echo "<?php
 phpinfo();
 ?>" >>/usr/share/nginx/html/index.php
systemctl restart nginx.service
