FROM alpine:3.12

# Expose ports
EXPOSE 3306

# Install mysql
RUN apk update
RUN apk upgrade
# mysql: to install mariadb, mysql-client: to install commands tools
RUN apk add mysql mysql-client

COPY my.cnf /etc/mysql/
COPY start.sh /tmp/
RUN chmod +x /tmp/start.sh

ENTRYPOINT [ "/bin/sh", "/tmp/start.sh" ]