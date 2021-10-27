#!/bin/bash
#Add to crontab
echo "*/5 * * * * root bash /PATH_TO_SCRIPT_FOLDER/check_nginx.sh" >> /etc/crontab