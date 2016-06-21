FROM alpine:3.2

RUN apk add --update mysql mysql-client && \
    rm -rf /var/cache/apk/*

RUN /usr/bin/mysql_install_db --user=mysql && \
    mkdir /run/mysqld && \
    chown -R mysql:root /run/mysqld

#    mkdir -p /var/lib/mysql && \
#    mkdir -p /etc/mysql/conf.d && \
#    { \
#        echo '[mysqld]'; \
#        echo 'user = root'; \
#        echo 'datadir = /var/lib/mysql'; \
#        echo 'port = 3306'; \
#        echo 'log-bin = /var/lib/mysql/mysql-bin'; \
#        echo '!includedir /etc/mysql/conf.d/'; \
#    } > /etc/mysql/my.cnf && \

#    sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

COPY assets/ /tmp/
RUN chmod +x /tmp/create_import_db.sh && \
    chown -R mysql:root /tmp

USER mysql
EXPOSE 3306
WORKDIR /tmp

ONBUILD COPY assets/databases /tmp/databases/
ONBUILD RUN /bin/sh /tmp/create_import_db.sh && \
            rm -rf /tmp/*

ENTRYPOINT ["mysqld"]
