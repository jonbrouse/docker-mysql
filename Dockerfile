FROM debian:jessie

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.5 && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ENV DEBIAN_FRONTEND=newt

COPY assets/post_inst.sh /tmp/post_inst.sh

ONBUILD COPY assets/databases /tmp/databases/
ONBUILD RUN chmod +x /tmp/post_inst.sh && \
  /bin/sh /tmp/post_inst.sh && \
  rm -rf /tmp/*

CMD ["mysqld"]

EXPOSE 3306
