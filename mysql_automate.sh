#!/bin/bash

apt-get update 
apt-get install mysql-server -y
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';"
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql
mysql -u root -ppassword -e "create database attendancedb;"
mysql -u root -ppassword -e "show databases;"
mysql -u root -ppassword -e "CREATE USER 'root' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "GRANT USAGE ON *.* TO 'root'@'%' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"
