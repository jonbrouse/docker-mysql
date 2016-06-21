#!/bin/bash

/usr/bin/mysqld --user=root &
sleep 5

for DB_FILENAME in `find . -name \*.sql -type f -exec basename {} .sql \;`; do
  DB_NAME=`basename ${DB_FILENAME} .sql`
  /usr/bin/mysqladmin -u root password '${ROOT_PASSWORD}'

  mysqladmin create ${DB_NAME} -p
  mysql -D ${DB_NAME} < ${DB_FILENAME}
  #mysql -D asterisk -u root -p < SQL/newinstall.sql
  echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'" | mysql
  echo "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%'; FLUSH PRIVILEGES" | mysql
  echo "GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
  echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY ${ROOT_PASSWORD} WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
done
