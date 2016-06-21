#!/bin/sh

/usr/bin/mysqld --user=root &
sleep 2

for DB_NAME in `find . -name \*.sql -type f -exec basename {} .sql \;`; do
  DB_FILENAME=/tmp/databases/${DB_NAME}.sql
  echo ${DB_NAME}
  echo ${DB_FILENAME}
  echo ${ROOT_PASSWORD}

  #/usr/bin/mysqladmin create ${DB_NAME} --user=root --password=${ROOT_PASSWORD}
  /usr/bin/mysqladmin create ${DB_NAME} --user=root
  mysql -D ${DB_NAME} -u root < ${DB_FILENAME}
#  #mysql -D asterisk -u root -p < SQL/newinstall.sql
#  echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'" | mysql
#  echo "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%'; FLUSH PRIVILEGES" | mysql
#  echo "GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
#  echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY ${ROOT_PASSWORD} WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
  /usr/bin/mysqladmin -u root password '${ROOT_PASSWORD}'
done
