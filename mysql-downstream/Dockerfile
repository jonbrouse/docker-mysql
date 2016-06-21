FROM jonbrouse/mysql

#COPY assets/databases /tmp/databases/
COPY assets/ /tmp/

ENV ROOT_PASSWORD="password"
RUN echo "This is the user password: $DB_USER_PASSWORD"

RUN /bin/sh /tmp/create_import_db.sh && \
    chown -R mysql:root /tmp

USER mysql

ENTRYPOINT ["mysqld"]
