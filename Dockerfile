FROM debian:jessie

RUN apt-get update && \
  apt-get install -y mysql-server-5.5 && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ONBUILD COPY assets/databases /tmp/

ONBUILD RUN chmod +x /tmp/post_inst.sh && \
  /bin/sh /tmp/post_inst.sh && \
  rm -rf /tmp/*

EXPOSE 3306

CMD ["mysqld"]
