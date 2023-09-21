#!/bin/bash

chown -R mysql:mysql /var/lib/mysql

service mariadb restart

#service mariadb status

mariadb << EOF
CREATE DATABASE wordpressdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON wordpressdb.* TO '$MYSQL_USER'@'localhost';

CREATE USER 'lilith'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON *.* to 'lilith'@'localhost' WITH GRANT OPTION;


FLUSH PRIVILEGES;
EXIT
EOF

#GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
#ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';


#change db ownder from root to mysql

service mariadb stop

#init mariadb service

mariadbd