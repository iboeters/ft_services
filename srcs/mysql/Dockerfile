FROM alpine:3.12

# Expose ports
EXPOSE 30022

# Install mysql
RUN apk update
RUN apk upgrade
# mysql: to install mariadb, mysql-client: to install commands tools
RUN apk add mysql mysql-client

COPY my.conf /etc/mysql/conf.d/

RUN mysql_install_db --user=${MYSQL_USER} --datadir=/var/lib/mysql
RUN mariadb start
RUN mysqladmin -u root password toor