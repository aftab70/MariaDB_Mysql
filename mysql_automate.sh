#!/bin/bash

sudo apt-get update 
sudo apt-get install mysql-server -y
sudo -i
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
exit
sudo systemctl restart mysql
mysql -u root -ppassword -e "create database attendancedb;"
mysql -u root -ppassword -e "show databases;"
