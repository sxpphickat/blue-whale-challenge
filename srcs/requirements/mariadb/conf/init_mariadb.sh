#!bin/bash

# CONFIGURE DB USERS
mariadb << EOF
CREATE DATABASE wordpressdb;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF


chown -R mysql:mysql /var/lib/mysql/wordpressdb