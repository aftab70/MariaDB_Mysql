#!/bin/bash

sudo apt-get update 
sudo apt-get install mysql-server -y
sudo -i
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
exit
sudo sed -i '17s@bind-address            = 127.0.0.1@bind-address            = 0.0.0.0@' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
mysql -u root -ppassword -e "create database attendancedb;"
mysql -u root -ppassword -e "show databases;"
mysql -u root -ppassword -e "CREATE USER 'root' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "GRANT USAGE ON *.* TO 'root'@'%' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"
