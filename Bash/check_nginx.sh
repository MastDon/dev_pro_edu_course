#!/bin/bash

PATH_TO_DEFAULT_CONFIG="/etc/nginx/nginx.conf" #SET DEFAULT CONFIG FILE
PATH_TO_BACKUP="/tmp/nginx.conf" #SET PATH TO BACKUP


copy_config() {
  echo "Copy config..." # BACKUP
  cp $PATH_TO_DEFAULT_CONFIG $PATH_TO_BACKUP

  if [ $? -ne 0 ]; then # CHECK  BACKUP
    echo "Backup config - FAIL"
  else
    echo "Backup config - SUCCESS!"
  fi
}







start_nginx_with_restore_config() {
  echo "Restore config from backup"
  sudo cp $PATH_TO_BACKUP $PATH_TO_DEFAULT_CONFIG #RESTORE
  sudo systemctl start nginx
  if [ $? -eq 0 ]; then
      echo "Nginx start - SUCCESS! "
  else
    echo "Nginx start - FAIL!"
  fi
}


start_nginx() {
  SUCCESS=0
  echo "Nginx start - FAIL!"
  for i in $(seq 1 2)
    do
    echo "Sleep 1 m"
    sleep 1m
    echo "Trying to start nginx..."
    sudo systemctl start nginx
    if [ $? -eq 0 ]; then
      echo "Nginx start - SUCCESS!"
      SUCCESS=1
      break
    else
      echo "Nginx start - FAIL!"
    fi
  done

  if [ $SUCCESS -eq 0 ]; then
    start_nginx_with_restore_config
  fi
}


run_nginx() {
  sudo systemctl start nginx

  if [ $? -ne 0 ]; then # CHECK STATUS
    start_nginx
  else
    echo "Nginx start - SUCCESS!"
  fi
}



copy_config

pgrep -x nginx >/dev/null && echo "Nginx RUNNING" || run_nginx