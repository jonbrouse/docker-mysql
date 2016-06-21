FROM alpine:3.2

RUN apk add --update mysql mysql-client && \
    rm -rf /var/cache/apk/* && \
    /usr/bin/mysql_install_db --user=mysql && \
    mkdir /run/mysqld && \
    chown -R mysql:root /run/mysqld

COPY assets/create_import_db.sh /tmp/create_import_db.sh

RUN chmod +x /tmp/create_import_db.sh && \
    chown -R mysql:root /tmp

USER mysql

EXPOSE 3306

WORKDIR /tmp

ENTRYPOINT ["mysqld"]
