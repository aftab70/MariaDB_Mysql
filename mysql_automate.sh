#!/bin/bash

apt-get update 
apt-get install mysql-server -y
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
sed -i '43s@bind-address            = 127.0.0.1@bind-address            = 0.0.0.0@' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql
mysql -u root -ppassword -e "create database attendancedb;"
mysql -u root -ppassword -e "show databases;"
mysql -u root -ppassword -e "CREATE USER 'root' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "GRANT USAGE ON *.* TO 'root'@'%' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"
