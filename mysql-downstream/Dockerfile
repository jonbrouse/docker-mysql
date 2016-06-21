FROM jonbrouse/mysql

ENV DB_USER=user \
    DB_USER_PASSWORD=password \
    ROOT_PASSWORD=password

COPY assets/databases /tmp/databases/
COPY assets/create_import_db.sh /tmp/create_import_db.sh

ENV ROOT_PASSWORD="password"
RUN echo "This is the user password: $DB_USER_PASSWORD"

RUN /bin/sh /tmp/create_import_db.sh && \
    chown -R mysql:mysql /var/tmp/mysql

WORKDIR /usr

ENTRYPOINT ["mysqld"]
