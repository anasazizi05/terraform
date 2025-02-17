#!/bin/bash

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password my_password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password my_password'
sudo apt-get update
sudo apt-get -y install mysql-server
wget https://gist.githubusercontent.com/ualmtorres/55325478004104fbe828683ea5131e40/raw/d8aa8015997ad1c410225eaff7a2c64462d7839a/sginit.sql -O /home/ubuntu/sginit.sql
mysql -h "localhost" -u "root" "-pmy_password" < "/home/ubuntu/sginit.sql"

sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart

