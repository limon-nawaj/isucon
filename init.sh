#!/bin/sh
set -x
set -e
cd $(dirname $0)

myuser=root
mydb=isu4_qualifier
myhost=localhost
myport=3306
mysql -h ${myhost} -P ${myport} -u ${myuser} -p -e "DROP DATABASE IF EXISTS ${mydb}; CREATE DATABASE ${mydb}"
mysql -h ${myhost} -P ${myport} -u ${myuser} -p ${mydb} < sql/schema.sql
mysql -h ${myhost} -P ${myport} -u ${myuser} -p ${mydb} < sql/dummy_users.sql
mysql -h ${myhost} -P ${myport} -u ${myuser} -p ${mydb} < sql/dummy_log.sql
