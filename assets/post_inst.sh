!/bin/bash

/usr/sbin/mysqld &
sleep 5

for DB_FILENAME in `find . -name \*.sql -type f -printf "%f\n"`; do
  DB_NAME=`basename -s .sql ${DB_FILENAME}`
  mysqladmin -uroot create ${DB_NAME}
  mysql -uroot ${DB_NAME} < ${DB_FILENAME}
  echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}'" | mysql
  echo "GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%'; FLUSH PRIVILEGES" | mysql
  echo "GRANT ALL ON *.* TO root@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
  echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY ${ROOT_PASSWORD} WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
done
