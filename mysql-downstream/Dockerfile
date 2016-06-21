FROM jonbrouse/mysql

COPY assets/databases /tmp/databases/

RUN chown -R mysql:root /tmp/* && \
    /bin/sh /tmp/create_import_db.sh && \
    rm -rf /tmp/*

ENTRYPOINT ["mysqld"]
