FROM alpine:3.12

# Expose ports
EXPOSE 3306

RUN apk update
RUN apk upgrade

# Install mysql: to install mariadb, mysql-client: to install commands tools
RUN apk add mysql mysql-client

COPY my.cnf /etc/
COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh

ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
