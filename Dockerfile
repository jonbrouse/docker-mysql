FROM jonbrouse/mysql

# We don't need to always COPY this guy.
#COPY assets/create_import_db.sh /tmp/create_import_db.sh

COPY assets/databases /tmp/databases/
RUN chmod +x create_import_db.sh && \
    /bin/sh /tmp/create_import_db.sh && \
     rm -rf /tmp/*

CMD ["mysqld"]
